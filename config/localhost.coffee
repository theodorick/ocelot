module.exports =

  authentication:
    'validation-client': "TPS_VALIDATOR"
    'validation-secret': "I7PM4yBf"
    'token-endpoint': "https://test.amp.monsanto.com/as/token.oauth2"
    'auth-endpoint': "https://test.amp.monsanto.com/as/authorization.oauth2"
    'user-info-endpoint': 'https://test.amp.monsanto.com/idp/userinfo.openid'
    'profile-endpoint': 'https://profile.velocity-np.ag/v1/users/$userId?fields=id,firstName,middleName,lastName,entitlements,email,fullName&apps=$appId'

  jwks:
    url: "https://test.amp.monsanto.com/pf/JWKS"

  wam:
    'converter-url': "https://test.amp.monsanto.com/pf/sts.wst"
    'converter-soap-req': "PHM6RW52ZWxvcGUgeG1sbnM6cz0iaHR0cDovL3d3dy53My5vcmcvMjAwMy8wNS9zb2FwLWVudmVsb3BlIiB4bWxuczphPSJodHRwOi8vd3d3LnczLm9yZy8yMDA1LzA4L2FkZHJlc3NpbmciIHhtbG5zOnU9Imh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3dzcy8yMDA0LzAxL29hc2lzLTIwMDQwMS13c3Mtd3NzZWN1cml0eS11dGlsaXR5LTEuMC54c2QiPgogIDxzOkhlYWRlcj4KICAgIDxhOkFjdGlvbiBzOm11c3RVbmRlcnN0YW5kPSIxIj5odHRwOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy93cy1zeC93cy10cnVzdC8yMDA1MTIvUlNUL0lzc3VlPC9hOkFjdGlvbj4KICAgIDxhOk1lc3NhZ2VJRD51cm46dXVpZDo1Njc1NDBiYS1hMDdlLTQxYjMtYmZiYi1lZGZkMjJjNTdlNDQ8L2E6TWVzc2FnZUlEPgogICAgPGE6UmVwbHlUbz4KICAgICAgPGE6QWRkcmVzcz5odHRwOi8vd3d3LnczLm9yZy8yMDA1LzA4L2FkZHJlc3NpbmcvYW5vbnltb3VzPC9hOkFkZHJlc3M+CiAgICA8L2E6UmVwbHlUbz4KICAgIDxhOlRvIHM6bXVzdFVuZGVyc3RhbmQ9IjEiPldBTV9DT05WRVJURVJfVVJMPC9hOlRvPgogICAgPG86U2VjdXJpdHkgczptdXN0VW5kZXJzdGFuZD0iMSIgeG1sbnM6bz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzLzIwMDQvMDEvb2FzaXMtMjAwNDAxLXdzcy13c3NlY3VyaXR5LXNlY2V4dC0xLjAueHNkIj4KCQk8bzpCaW5hcnlTZWN1cml0eVRva2VuIHhtbG5zOnU9Imh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3dzcy8yMDA0LzAxL29hc2lzLTIwMDQwMS13c3Mtd3NzZWN1cml0eS11dGlsaXR5LTEuMC54c2QiCiAgICAgICBFbmNvZGluZ1R5cGU9Imh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3dzcy8yMDA0LzAxL29hc2lzLTIwMDQwMS13c3Mtc29hcC1tZXNzYWdlLXNlY3VyaXR5LTEuMCNCYXNlNjRCaW5hcnkiCiAgICAgICBWYWx1ZVR5cGU9InVybjpwaW5naWRlbnRpdHkuY29tOm9hdXRoMjpncmFudF90eXBlOnZhbGlkYXRlX2JlYXJlciIgCiAgICAgICB1OklkPSJhYmMiPkJBU0U2NF9FTkNPREVEX09BVVRIX1RPS0VOPC9vOkJpbmFyeVNlY3VyaXR5VG9rZW4+CiAgICA8L286U2VjdXJpdHk+CiAgPC9zOkhlYWRlcj4KICA8czpCb2R5PgogICAgPHRydXN0OlJlcXVlc3RTZWN1cml0eVRva2VuIHhtbG5zOnRydXN0PSJodHRwOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy93cy1zeC93cy10cnVzdC8yMDA1MTIiPgogICAgICA8d3NwOkFwcGxpZXNUbyB4bWxuczp3c3A9Imh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDQvMDkvcG9saWN5Ij4KICAgICAgICA8YTpFbmRwb2ludFJlZmVyZW5jZT4KICAgICAgICAgIDxhOkFkZHJlc3M+b2F1dGg6d2FtPC9hOkFkZHJlc3M+CiAgICAgICAgPC9hOkVuZHBvaW50UmVmZXJlbmNlPgogICAgICA8L3dzcDpBcHBsaWVzVG8+CiAgICAgIDx0cnVzdDpLZXlUeXBlPmh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3dzLXN4L3dzLXRydXN0LzIwMDUvMTIvQmVhcmVyPC90cnVzdDpLZXlUeXBlPgogICAgICA8dHJ1c3Q6UmVxdWVzdFR5cGU+aHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wMi90cnVzdC9Jc3N1ZTwvdHJ1c3Q6UmVxdWVzdFR5cGU+CiAgICA8L3RydXN0OlJlcXVlc3RTZWN1cml0eVRva2VuPgogIDwvczpCb2R5Pgo8L3M6RW52ZWxvcGU+Cg=="

  'default-protocol': "http"
  'enforce-https': false
  'cors-domains': ["velocity.ag", "https://velocity.ag", "monsanto.com", "threega.com", "localhost", "velocity-np.ag", "https://velocity-np.ag", "http://localhost"]
  'log-level': "debug"

  backend:
    provider: "redis"
    host: "127.0.0.1"
    port: "6379"
