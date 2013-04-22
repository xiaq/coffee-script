# Search for 'keywords' in parallel, then callback
# 'cb' with an array of the parallel results
parallelSearch = (keywords, cb) ->
  results = []
  n_out = 0
  cb_generator = (i) ->
    n_out++
    (json) ->
      results[i] = json
      if n_out-- is 0
        cb results
  for k,i in keywords
    search k, cb_generator i
