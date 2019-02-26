require 'rails_helper'

describe Fav do
  it 'builds a favorite poro' do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GOOGLE_API_KEY"]}")
                  .to_return(body: File.read("./spec/fixtures/geocode_response.json"))

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392358,-104.990251")
                  .to_return(body: File.read("./spec/fixtures/darksky_response.json"))

    user = User.create(email: "nick@nick.com", password: "password", api_key: "12344")
    favorite = user.favorites.create(location: "denver,co")
    favs = Fav.new.build(favorite)

    expect(favs.humidity).to eq(0.64)
    expect(favs.precipitation).to eq(0)
    expect(favs.summary).to eq("Mostly Cloudy")
    expect(favs.temperature).to eq(27.35)
    expect(favs.time).to eq("Mon Feb 25 09:49:31 2019")
    expect(favs.uv_index).to eq(2)
    expect(favs.visibility).to eq(10)
  end
end
