require 'rails_helper'

describe WeatherAdapter do
  it 'calls service and returns forecast based on coordinates' do
    VCR.use_cassette("darksky_service_spec") do
      forecast = WeatherAdapter.new.forecast({:lat=>39.7392358, :lng=>-104.990251})

      expect(forecast.class).to be(Hash)
    end
  end
end
