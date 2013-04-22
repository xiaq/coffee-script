w_list = [ "sun", "rain", "snow", "sleet" ]
f_list = [ "tacos", "burritos", "pizza", "shrooms" ]
await rankPopularity w_list, defer weather
if weather.length
  await rankPopularity f_list, defer food
if weather.length and food.length
  await search "#{weather[0]}+#{food[0]}", defer tweets
  msg = tweets[0]?.text
alert if msg? then msg else "<nothing found>"
