# Search for 'keyword' on twitter, then callback 'cb'
# with the results found.
search = (keyword, cb) ->
  host = "http://search.twitter.com/"
  url = "#{host}/search.json?q=#{keyword}&callback=?"
  await $.getJSON url, defer json
  cb json.results


