# Twitter OAuth
qs = require('querystring')
oauth =
  callback: 'http://mysite.com/callback/'
  consumer_key : CONSUMER_KEY
  consumer_secret: CONSUMER_SECRET
url = 'https://api.twitter.com/oauth/request_token'


await request.post {url:url, oauth:oauth}, defer e, r, body
# Assume by some stretch of magic you aquired the verifier
access_token = qs.parse body
oauth = 
  consumer_key: CONSUMER_KEY
  consumer_secret: CONSUMER_SECRET
  token: access_token.oauth_token
  verifier: VERIFIER
  token_secret: access_token.oauth_token_secret

url = 'https://api.twitter.com/oauth/access_token'
    
request.post {url:url, oauth:oauth}, defer e, r, body
perm_token = qs.parse body
oauth = 
  consumer_key: CONSUMER_KEY
  consumer_secret: CONSUMER_SECRET
  token: perm_token.oauth_token
  token_secret: perm_token.oauth_token_secret

url = 'https://api.twitter.com/1/users/show.json?'
params = 
  screen_name: perm_token.screen_name
  user_id: perm_token.user_id


url += qs.stringify params
await request.get {url:url, oauth:oauth, json:true}, defer e, r, user
console.log user
