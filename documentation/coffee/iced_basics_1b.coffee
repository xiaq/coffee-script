slowAlert = (w,s,cb) ->
  await setTimeout defer(), w
  alert s
  cb()
