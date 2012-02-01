w_list = [ "sun", "rain", "snow", "sleet" ]
f_list = [ "tacos", "burritos", "pizza", "shrooms" ]
nothing = "<nothing found>"
rankPopularity w_list, (weather) ->
  if weather.length
    rankPopularity f_list, (food) ->
      if weather.length and food.length
        search "#{weather[0]}+#{food[0]}", (tweets)->
          msg = tweets[0]?.text
          alert if msg? then msg else nothing
      else
        alert nothing
  else
    alert nothing

