class DarkskyService

  def get_forecast(lat,lng)
    hash = jsonify("/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}")
  end

  private

  def connect
    Faraday.new(url:"https://api.darksky.net/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def jsonify(path)
    JSON.parse(connect.get(path).body, symbolize_names: true)
  end
end
