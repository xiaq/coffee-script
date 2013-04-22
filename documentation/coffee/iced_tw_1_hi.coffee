# Search for 'keyword' on twitter, then callback 'cb'
# with the results found.
search = (keyword, cb) ->
  host = "http://search.twitter.com/"
  url = "#{host}/search.json?q=#{keyword}&callback=?"
  $.getJSON url, (json) ->
    cb json.results

