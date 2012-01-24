out = 0
next = ->
  out++
  () -> if --out is 0
    slowAlert 500, "back after a delay", () ->
       alert "Goodbye!"

slowAlert 500,  "hello",  next()
slowAlert 1000, "friend", next()
