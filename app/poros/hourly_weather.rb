class HourlyWeather
  attr_reader :time,
              :icon,
              :temp

  def initialize(weather_data)
    @time = Time.at(weather_data[:time]).ctime
    @icon = weather_data[:icon]
    @temp = weather_data[:temperature]
  end

end
