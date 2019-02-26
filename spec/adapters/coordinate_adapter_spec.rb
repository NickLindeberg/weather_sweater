require 'rails_helper'

describe CoordinateAdapter do
  it 'calls service and returns coordinates based on location' do
    VCR.use_cassette("google_coords_service_spec") do
      coords = CoordinateAdapter.new.pinpoint("denver,co")

      expect(coords).to eq({:lat=>39.7392358, :lng=>-104.990251})
    end
  end
end
