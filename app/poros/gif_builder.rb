class GifBuilder

  def initialize(location)
    @location = location
    google = GoogleCoordsService.new
    darksky = DarkskyService.new
    coords = google.get_coords(location)
    @forecast = darksky.get_forecast(coords[:lat], coords[:lng])
    require "pry"; binding.pry
  end

  def images

  end

end
