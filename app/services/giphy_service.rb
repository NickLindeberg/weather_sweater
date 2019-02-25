class GiphyService

  def get_gif(term)
    hash = jsonify("search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{term}")
    hash[:data].sample
  end

  def connect
    Faraday.new(url: "https://api.giphy.com/v1/gifs/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def jsonify(url)
    JSON.parse(connect.get(url).body, symbolize_names: true)
  end

end
