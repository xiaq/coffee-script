# Search for the most popular food and the most
# popular weather pattern in parallel.
w_list = [ "sun", "rain", "snow", "sleet" ]
f_list = [ "tacos", "burritos", "pizza", "shrooms" ]

o = {}
n_out = 0
nothing = "<nothing found>"
  
cb_generator = (field) ->
  n_out++
  (json) ->
    o[field] = json
    if --n_out is 0
      # If we got results for both, do a final search
      if o.weather.length and o.food.length
        search "#{o.weather[0]}+#{o.food[0]}", (tweets) ->
          # Alert the results to the browser
          msg = tweets[0]?.text
          alert if msg? then msg else nothing
      else
        alert nothing

rankPopularity w_list, cb_generator "weather"
rankPopularity f_list, cb_generator "food"
