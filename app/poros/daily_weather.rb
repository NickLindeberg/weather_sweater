class DailyWeather
  attr_reader :time,
              :summary,
              :icon,
              :precipitation,
              :high,
              :low,
              :visibility
              
  def initialize(weather_data)
    @time = Time.at(weather_data[:time]).ctime
    @summary = weather_data[:summary].gsub(/[^0-9a-z ]/i, '')
    @icon = weather_data[:icon]
    @precipitation = weather_data[:precipProbability]
    @high = weather_data[:temperatureHigh]
    @low = weather_data[:temperatureLow]
    @visibility = weather_data[:visibility]
  end

end
