class GoogleCoordsService

  def get_coords(city)
    hash = jsonify("/maps/api/geocode/json?address=#{city}&key=#{ENV['GOOGLE_API_KEY']}")
    hash[:results][0][:geometry][:location]
  end

  private

  def connect
    Faraday.new(url:"https://maps.googleapis.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def jsonify(path)
    JSON.parse(connect.get(path).body, symbolize_names: true)
  end

end
