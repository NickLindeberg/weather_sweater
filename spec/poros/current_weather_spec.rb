require 'rails_helper'

describe DailyWeather do
  it 'exists' do
    data = {time: 1550905200,
            summary: "Cloudy",
            precipProbability: 0.55,
            apparentTemperature: 31.02,
            humidity: 17.30,
            uvIndex: 5.10,
            visibility: 5
          }

    current_weather = CurrentWeather.new(data)
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.time).to eq("Sat Feb 23 00:00:00 2019")
    expect(current_weather.summary).to eq("Cloudy")
    expect(current_weather.precipitation).to eq(0.55)
    expect(current_weather.temperature).to eq(31.02)
    expect(current_weather.humidity).to eq(17.30)
    expect(current_weather.uv_index).to eq(5.10)
    expect(current_weather.visibility).to eq(5)
  end
end
