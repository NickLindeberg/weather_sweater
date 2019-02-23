class CurrentWeather
  attr_reader :time,
              :summary,
              :precipiation,
              :temperature,
              :humidity,
              :uv_index,
              :visibility

  def initialize(weather_data)
    @time = Time.at(weather_data[:time]).ctime
    @summary = weather_data[:summary].gsub(/[^0-9a-z ]/i, '')
    @precipitation = weather_data[:precipProbability]
    @temperature = weather_data[:apparentTemperature]
    @humidity = weather_data[:humidity]
    @uv_index = weather_data[:uvIndex]
    @visibility = weather_data[:visibility]
  end
end
