class ForecastBuilder
  attr_reader :location

  def initialize(location)
    @location = location
    coords = CoordinateAdapter.new.pinpoint(location)
    @forecast = WeatherAdapter.new.forecast(coords)
  end

  def currently
    CurrentWeather.new(@forecast[:currently])
  end

  def daily
    @forecast[:daily][:data].map do |days|
      DailyWeather.new(days)
    end
  end

  def hourly
    @forecast[:hourly][:data].map do |hours|
      HourlyWeather.new(hours)
    end
  end
end
