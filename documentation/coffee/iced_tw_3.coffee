# Search for 'keywords' in serial, then callback 'cb' with
# an array of the parallel results
serialSearch = (keywords, cb) ->
  out = []
  for k,i in keywords
    await search k, defer out[i]
  cb out
