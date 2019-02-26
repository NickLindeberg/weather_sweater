class GifBuilder
  attr_reader :location,
              :copyright

  def initialize(location)
    @location = location
    google = GoogleCoordsService.new
    darksky = DarkskyService.new
    coords = google.get_coords(location)
    @forecast = darksky.get_forecast(coords[:lat], coords[:lng])
  end

  def images
    @forecast[:daily][:data].map do |days|
      Gifs.new(days)
    end
  end

  def copyright
    Time.now.year.to_s
  end
end
