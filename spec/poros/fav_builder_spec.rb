require 'rails_helper'

describe FavBuilder do
  it 'creates body out of user favorites' do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GOOGLE_API_KEY"]}")
                  .to_return(body: File.read("./spec/fixtures/geocode_response.json"))

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392358,-104.990251")
                  .to_return(body: File.read("./spec/fixtures/darksky_response.json"))

    user = User.create(email: "nick@nick.com", password: "password", api_key: "12344")
    favorite_1 = user.favorites.create(location: "denver,co")

    fav = FavBuilder.new(user)
    expect(fav.body.first).to have_key(:location)
    expect(fav.body.first).to have_key(:current_weather)
    expect(fav.body.first[:current_weather]).to be_a(CurrentWeather)
  end
end
