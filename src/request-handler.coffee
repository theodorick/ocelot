resolver = require './resolver'
rewrite = require './rewrite'
validate = require './auth/validate'
proxy = require './proxy'
exchange = require './auth/exchange'
authCodeRefresh = require './auth/refresh/auth-code-refresh'
response = require './response'
config = require 'config'
redirect = require './auth/redirect'
cors = require './cors'
headers = require './auth/headers'
tokenInfo = require './auth/token-info'
upgrade = require './upgrade'
clientWhitelist = require './auth/client-whitelist'
URL = require 'url'
parseCookies = require './parseCookies'
prometheus = require './metrics/prometheus'
tokenRefresh = require './auth/refresh/token-refresh'

authenticateAndProxy = (px, req, res, route, url, cookies) ->
    authFulfilled = (authentication) ->
        if tokenInfo.accept req
            tokenInfo.complete route, res, authentication
        else if clientWhitelist.accept route, authentication
            clientWhitelist.complete res
        else
            headers.addAuth req, route, authentication, cookies
            headers.addCustomHeaders req, route
            proxy.request px, req, res, url

    authRejected = () ->
        if authCodeRefresh.accept route, cookies
            authCodeRefresh.complete req, res, route, cookies
        else if redirect.accept route
            redirect.startAuthCode req, res, route
        else
            response.send res, 403, 'Authorization missing or invalid'

    validate.authentication(req, route, cookies).then authFulfilled, authRejected

redirectOrSend404 = (req, res, host) ->
    if host.indexOf('www.') is 0
        res.setHeader 'Location', "#{config.get('default-protocol')}://#{host.slice 4}#{req.url}"
        response.send res, 301
    else
        response.send res, 404, 'Route not found'

handleDefaultRequest = (px, req, res) ->
    {host} = req.headers
    cookies = parseCookies req
    route = resolver.resolveRoute req.url, host
    if not route?
        redirectOrSend404 req, res, host
    else if exchange.accept req
        exchange.authCodeFlow req, res, route
    else if tokenRefresh.accept req, route, cookies
        tokenRefresh.complete req, res, route, cookies
    else
        url = rewrite.mapRoute req.url, route
        if url
            authenticateAndProxy px, req, res, route, url, cookies
        else
            response.send res, 404, 'No active URL for route'

module.exports =
  create: (px) ->
      (req, res) ->
          res.setHeader 'powered-by', 'ocelot'
          prometheus.requestProcessing(req)
          res.on 'finish', ->
              prometheus.requestFinished(req)
          res.on 'close', ->
              prometheus.requestFinished(req)

          cors.setCorsHeaders req, res
          if cors.shortCircuit req then response.send res, 204
          else if upgrade.accept req then upgrade.complete req, res
          else handleDefaultRequest px, req, res
