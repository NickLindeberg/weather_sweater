class FlickrService

  def get_image(tag)
    hash = jsonify("?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=#{ENV['FLICKR_API_KEY']}&tags=#{tag}")
    hash[:photos][:photo].sample
  end

  private

  def connect
    Faraday.new(url:"https://api.flickr.com/services/rest/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def jsonify(path)
    JSON.parse(connect.get(path).body, symbolize_names: true)
  end
end
