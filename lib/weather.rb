module Weather

  def weather_rand
    chance = rand(10)
    chance < 5 ? "sunny" : "stormy"
  end
end