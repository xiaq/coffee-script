# Search for 'keywords' in serial, then callback
# 'cb' with an array of the parallel results
serialSearch = (keywords, cb) ->
  result = []
  i = 0
  launch = () ->
    if i < keywords.length
       j = i++
       search keywords[j], cb_generator j
     else
       cb results
  cb_generator = (i) ->
    (json) ->
      results[i] = json
      launch()
