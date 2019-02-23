require 'rails_helper'

describe ForecastBuilder do
  before(:each) do
    @location = "chicago,il"
  end

  it 'exists' do
    VCR.use_cassette("forecast_builder_spec") do
      expect(ForecastBuilder.new(@location)).to be_a(ForecastBuilder)
    end
  end

  it 'currently' do
    VCR.use_cassette("forecast_builder_spec") do
      current_weather = ForecastBuilder.new(@location).currently

      expect(current_weather).to be_a(CurrentWeather)
      expect(current_weather.humidity).to eq(1)
      expect(current_weather.precipitation).to eq(1)
      expect(current_weather.summary).to eq("Rain")
      expect(current_weather.time).to eq("Sat Feb 23 16:32:58 2019")
      expect(current_weather.temperature).to eq(29.08)
      expect(current_weather.uv_index).to eq(0)
      expect(current_weather.visibility).to eq(0)
    end
  end

  it 'daily' do
    VCR.use_cassette("forecast_builder_spec") do
      daily_weather = ForecastBuilder.new(@location).daily

      expect(daily_weather[0]).to be_a(DailyWeather)
      expect(daily_weather[0].high).to eq(37.74)
      expect(daily_weather[0].icon).to eq("rain")
      expect(daily_weather[0].low).to eq(33.13)
      expect(daily_weather[0].precipitation).to eq(1)
      expect(daily_weather[0].summary).to eq("Rain until afternoon starting again in the evening")
      expect(daily_weather[0].time).to eq("Fri Feb 22 23:00:00 2019")
      expect(daily_weather[0].visibility).to eq(4.53)
    end
  end

  it 'hourly' do
    VCR.use_cassette("forecast_builder_spec") do
      hourly_weather = ForecastBuilder.new(@location).hourly

      expect(hourly_weather[0]).to be_a(HourlyWeather)
      expect(hourly_weather[0].icon).to eq("fog")
      expect(hourly_weather[0].temp).to eq(34.56)
      expect(hourly_weather[0].time).to eq("Sat Feb 23 16:00:00 2019")
    end
  end
end
