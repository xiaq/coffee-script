# Search for 'keywords' in parallel, then callback
# 'cb' with an array of the parallel results
parallelSearch = (keywords, cb) ->
  out = []
  await 
    for k,i in keywords
      search k, defer out[i]
  cb out
