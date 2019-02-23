require 'rails_helper'

describe 'Darksky service' do
  before(:each) do
    @dservice = DarkskyService.new
  end
  it 'exists' do
    VCR.use_cassette("darksky_service_spec") do

      expect(@dservice).to be_a(DarkskyService)
    end
  end

  it 'can find lat and lng when given a city and state' do
    VCR.use_cassette("darksky_service_spec") do
      lat = 39.7392358
      lng = -104.990251

      response = @dservice.get_forecast(lat,lng)

      expect(response).to have_key(:currently)
      expect(response[:currently][:summary]).to eq("Partly Cloudy")

      expect(response).to have_key(:hourly)
      expect(response[:hourly][:data].count).to eq(49)
      expect(response[:hourly][:data].first[:summary]).to eq("Snow")

      expect(response).to have_key(:daily)
      expect(response[:daily][:data].count).to eq(8)
      expect(response[:daily][:summary]).to eq("Snow (1–2 in.) today and Friday, with high temperatures rising to 59°F on Thursday.")
    end
  end
end
