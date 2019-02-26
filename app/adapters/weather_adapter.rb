class WeatherAdapter

  def forecast(coords)
    dark_sky = DarkskyService.new
    dark_sky.get_forecast(coords[:lat], coords[:lng])
  end

end
