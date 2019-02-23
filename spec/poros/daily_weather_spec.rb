require 'rails_helper'

describe DailyWeather do
  it 'exists' do
    data = {time: 1550905200,
            summary: "Cloudy",
            icon: 'snow',
            precipProbability: 0.55,
            temperatureHigh: 31.02,
            temperatureLow: 17.30,
            visibility: 5
          }

    day_weather = DailyWeather.new(data)
    expect(day_weather).to be_a(DailyWeather)
    expect(day_weather.time).to eq("Sat Feb 23 00:00:00 2019")
    expect(day_weather.summary).to eq("Cloudy")
    expect(day_weather.icon).to eq("snow")
    expect(day_weather.precipitation).to eq(0.55)
    expect(day_weather.high).to eq(31.02)
    expect(day_weather.low).to eq(17.30)
    expect(day_weather.visibility).to eq(5)
  end
end
