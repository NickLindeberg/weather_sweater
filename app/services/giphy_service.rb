class GiphyService

  def get_gifs(location)
    hash = jsonify("?api_key=#{ENV['GIPHY_API_KEY']}&q=#{location}")
  end

  def connect
    Faraday.new(url: "https://api.giphy.com/search")
  end

  def jsonify(term)
    JSON.parse(connect.get(url).body, symbolize_names: true)
  end

end
