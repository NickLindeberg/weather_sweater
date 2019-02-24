class BackgroundBuilder
  attr_reader :location, :flickr_response, :url


  def initialize(location)
    @location = location
    @flickr_response = FlickrService.new.get_image(@location)
  end

  def url
    url = FlickrUrl.new.build(@flickr_response)
  end
end
