require 'rails_helper'

describe GifBuilder do
  before(:each) do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GOOGLE_API_KEY"]}")
                .to_return(body: File.read("./spec/fixtures/geocode_response.json"))

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392358,-104.990251")
                .to_return(body: File.read("./spec/fixtures/darksky_response.json"))
  end
  
  it 'creates gifs based on weather data based on location' do
    VCR.use_cassette("gifs_request_spec") do

      gifs = GifBuilder.new("denver,co").images
      expect(gifs.count).to eq(8)
      expect(gifs.first.summary).to eq("Mostly cloudy until evening")
      expect(gifs.first.time).to eq(1551078000)
      expect(gifs.first.url).to eq("https://giphy.com/embed/63xBFHKNVjZlu")
    end
  end
  it 'shows copyright information' do
    gifs = GifBuilder.new("denver,co").copyright

    expect(gifs).to eq("2019")
  end
end
