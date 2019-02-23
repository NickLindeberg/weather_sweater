require 'rails_helper'

describe 'Google coordinates service' do
  before(:each) do
    @gservice = GoogleCoordsService.new
  end
  it 'exists' do
    VCR.use_cassette("google_coords_service_spec") do

      expect(@gservice).to be_a(GoogleCoordsService)
    end
  end

  it 'can find lat and lng when given a city and state' do
    VCR.use_cassette("google_coords_service_spec") do
      city = "denver,co"

      expect(@gservice.get_coords(city)).to eq({"lat": 39.7392358, "lng": -104.990251})
    end
  end
end
