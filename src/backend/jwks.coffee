cron = require 'node-crontab'
jsonLoader = require './json'
_ = require 'underscore'
config = require 'config'
keys = undefined
jwksUrl = undefined
forge = require 'node-forge'

reloadData = ->
    jsonLoader.get(jwksUrl).then ((data) ->
        keys = parseJWKS(data)
    ), (error) ->
        console.log 'could not load JWKS keys: ' + error

parseJson = (jwksJSON, keyRegex, mutate) ->
    _.filter _.map(jwksJSON, (item) ->
        try
            if keyRegex.test(item.Key)
                decodedValue = JSON.parse(new Buffer(item.Value, 'base64').toString('utf8'))
                match = keyRegex.exec(item.Key)
                mutate(decodedValue, match)
            else null
        catch e
            console.log 'error parsing: ' + item.Key
            null
    ), (obj) ->
        obj != null

parseJWKS = (jwksJSON) ->
    newKeys = {}
    _.each(jwksJSON.keys, (key) ->
        newKeys[key.kid] = key)
    newKeys

validateToken = (token) ->
    console.log "Starting oidc validation"
    parts = token.split "."
    console.log "Split parts, going to look for #{JSON.parse(new Buffer(parts[0], 'base64').toString('utf8')).kid}"
    key = keys[JSON.parse(new Buffer(parts[0], 'base64').toString('utf8')).kid]
    if key
        console.log "All keys = #{JSON.stringify(keys)}"
        console.log "Retrieved specific key #{key}"
        pubKey = forge.pki.setRsaPublicKey(key.n, key.e)
        console.log "Created public key"
        md = parts[0] + "." + parts[1]
        signature = parts[2]
        console.log "About to verify"
        valid = pubKey.verify(md, signature)
        console.log "Was OIDC validated? #{valid}"
        valid
    else
        false

module.exports =
    initCache: ->
        jwksUrl = config.get('jwks.url')
        reloadData()
        cron.scheduleJob '*/20 * * * * *', reloadData
    getKeys: ->
        keys
    reloadData: reloadData
    validateToken: validateToken