class ForecastBuilder
  attr_reader :location

  def initialize(location)
    @location = location
    google = GoogleCoordsService.new
    darksky = DarkskyService.new
    coords = google.get_coords(location)
    @forecast = darksky.get_forecast(coords[:lat], coords[:lng])
  end

  def currently
    CurrentWeather.new(@forecast[:currently])
  end

  def daily
    @forecast[:daily]
  end

  def hourly
    @forecast[:hourly]
  end
end
