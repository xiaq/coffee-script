# Search for the most popular food and the most
# popular weather pattern in parallel.
w_list = [ "sun", "rain", "snow", "sleet" ]
f_list = [ "tacos", "burritos", "pizza", "shrooms" ]

await
  rankPopularity w_list, defer weather
  rankPopularity f_list, defer food

# If we got results for both, do a final search
if weather.length and food.length
  await search "#{weather[0]}+#{food[0]}", defer tweets
  msg = tweets[0]?.text

# Alert the results to the browser
alert if msg? then msg else "<nothing found>"
