class WeatherAdapter
  
  def forecast(coords)
    DarkskyService.new.get_forecast(coords[:lat], coords[:lng])
  end
end
