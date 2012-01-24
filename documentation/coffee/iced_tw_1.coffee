
# Search for 'keyword' on twitter, then callback 'cb' with the
# results found.
search = (keyword, cb) ->
  url = "http://search.twitter.com/search.json?q=#{keyword}&callback=?"
  await $.getJSON url, defer json
  cb json.results

# Search for 'keywords' in parallel, then callback 'cb' with
# an array of the parallel results
parallelSearch = (keywords, cb) ->
  out = []
  await 
    for k,i in keywords
      search k, defer out[i]
  cb out

# Do a parallel search on 'keywords', and call 'cb' with the
# keywords sorted in decreasing popular order.  Determine
# popularity based on the time of the least recent tweet
# (since we always get 15 back from Twitter).
rankPopularity = (keywords, cb) ->
  await parallelSearch keywords, defer results
  times = for r,i in results
    last = r[r.length - 1]
    [(new Date last.created_at).getTime(), i]
  times = times.sort (a,b) -> b[0] - a[0]
  cb (keywords[tuple[1]] for tuple in times)

# Search for the most popular food and the most populare weather
# pattern in parallel.
await
  rankPopularity [ "sun", "rain", "snow", "sleet" ],            defer weather
  rankPopularity [ "tacos", "burritos", "pizza", "mushrooms" ], defer food

# If we got results for both, then search for both in one search.
if weather.length and food.length
  await search "#{weather[0]}+#{food[0]}", defer tweets
  msg = tweets[0]?.text

# Alert the results to the browser
alert if msg? then msg else "<nothing found>"
