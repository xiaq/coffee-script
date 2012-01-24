# Do a parallel search on 'keywords', and call 'cb' with the
# keywords sorted in decreasing popular order.  Determine
# popularity based on the time of the least recent tweet
# (since we always get 15 back from Twitter).
rankPopularity = (keywords, cb) ->
  parallelSearch keywords, (results) ->
    times = for r,i in results
      last = r[r.length - 1]
      [(new Date last.created_at).getTime(), i]
    times = times.sort (a,b) -> b[0] - a[0]
    cb (keywords[tuple[1]] for tuple in times)


