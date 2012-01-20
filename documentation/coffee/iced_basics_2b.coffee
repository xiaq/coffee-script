out = 2
next = ->
  unless --out 
    slowAlert 500, "back after a delay", () ->
       alert "Goodbye!"

slowAlert 500,  "hello",  next
slowAlert 1000, "friend", next
