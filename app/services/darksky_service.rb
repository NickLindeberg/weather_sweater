class DarkskyService

  def get_forecast(lat,lng)
    hash = jsonify("/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}")
  end

  private

  def connect
    Faraday.new(url:"https://api.darksky.net/") do |faraday|
      faraday.use :http_cache, store: Rails.cache, logger: ActiveSupport::Logger.new(STDOUT)
      faraday.adapter Faraday.default_adapter
      faraday.response :json, :content_type => /\bjson$/
      faraday.use Faraday::OverrideCacheControl, cache_control: ‘public, max-age=3600’
    end
  end

  def jsonify(path)
    JSON.parse(connect.get(path).body, symbolize_names: true)
  end
end
