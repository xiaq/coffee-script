search = (keyword, cb) ->
  url = "http://search.twitter.com/search.json?q=#{keyword}&callback=?"
  await $.getJSON url, defer json
  cb json.results

parallelSearch = (keywords, cb) ->
  out = []
  await 
    for k,i in keywords
      search k, defer out[i]
  cb out

rankPopularity = (keywords, cb) ->
  await parallelSearch keywords, defer results
  times = for r,i in results
    last = r[r.length - 1]
    [(new Date last.created_at).getTime(), i]
  times = times.sort (a,b) -> b[0] - a[0]
  cb (keywords[tuple[1]] for tuple in times)
  
await
  rankPopularity [ "sun", "rain", "snow", "sleet" ],            defer weather
  rankPopularity [ "tacos", "burritos", "pizza", "mushrooms" ], defer food
  
await search "#{weather[0]}+#{food[0]}", defer tweets

alert tweets[0].text
