require 'rails_helper'

describe HourlyWeather do
  it 'exists' do
    data = {time: 1550905200,
            icon: 'snow',
            temperature: 31.03
          }

    hour_weater = HourlyWeather.new(data)
    expect(hour_weater).to be_a(HourlyWeather)
    expect(hour_weater.time).to eq("Sat Feb 23 00:00:00 2019")
    expect(hour_weater.icon).to eq("snow")
    expect(hour_weater.temp).to eq(31.03)
  end
end
