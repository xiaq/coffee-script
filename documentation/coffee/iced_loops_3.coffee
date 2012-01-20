for i in [0..2]
  await
    slowAlert 100, "alert A #{i}", defer()
    slowAlert 200, "alert B #{i}", defer()

