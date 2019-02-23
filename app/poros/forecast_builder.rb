class ForecastBuilder
  attr_reader :location

  def initialize(location)
    location = location
    google = GoogleCoordsService.new
    coords = google.get_coords(location)
    @forecast = darksky.get_forecast(coords[:lat], coords[:lng])
  end

  def currently
    @forecast[:currently]
  end

  def daily
    @forecast[:daily]
  end

  def hourly
    @forecast[:hourly]
  end

  private

  def darksky
    DarkskyService.new
  end

end
