require 'rails_helper'

describe 'visitor or user can see a forecast' do
  it 'shows forcast for specific city' do
    VCR.use_cassette("forecast_request_spec") do
      get "/api/v1/forecast?location=denver,co"

      data = JSON.parse(response.body, symbolize_names: true)[:data]
      attributes = data[:attributes]

      expect(response).to be_successful
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data[:id]).to eq("denver,co")
      expect(data[:type]).to eq("forecast")

      expect(attributes).to have_key(:currently)
      currently = attributes[:currently]
      expect(currently.count).to eq(7)
      expect(currently).to have_key(:time)
      expect(currently).to have_key(:summary)
      expect(currently).to have_key(:precipitation)
      expect(currently).to have_key(:temperature)
      expect(currently).to have_key(:humidity)
      expect(currently).to have_key(:uv_index)
      expect(currently).to have_key(:visibility)

      expect(attributes).to have_key(:daily)
      daily = attributes[:daily]
      expect(daily.count).to eq(8)
      expect(daily[0]).to have_key(:time)
      expect(daily[0]).to have_key(:summary)
      expect(daily[0]).to have_key(:icon)
      expect(daily[0]).to have_key(:precipitation)
      expect(daily[0]).to have_key(:high)
      expect(daily[0]).to have_key(:low)
      expect(daily[0]).to have_key(:visibility)

      expect(attributes).to have_key(:hourly)
    end
  end
end
