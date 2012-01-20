await
  slowAlert 500, "hello", defer()
  slowAlert 1000, "friend", defer()
await slowAlert 500, "back after a delay", defer()
alert "Goodbye!"
