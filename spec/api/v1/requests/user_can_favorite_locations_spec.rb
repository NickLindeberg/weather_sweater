require 'rails_helper'

describe 'request' do
  before(:each) do
    @headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    @user = User.create(email: "nick@nick.com", password: "password", api_key: "12344")
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GOOGLE_API_KEY"]}")
                  .to_return(body: File.read("./spec/fixtures/geocode_response.json"))

    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=chicago,il&key=#{ENV["GOOGLE_API_KEY"]}")
                  .to_return(body: File.read("./spec/fixtures/chicago_response.json"))

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392358,-104.990251")
                  .to_return(body: File.read("./spec/fixtures/darksky_response.json"))
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/41.8781136,-87.6297982")
                  .to_return(body: File.read("./spec/fixtures/dark_chicago_response.json"))
  end

  it 'creates favorite location for user' do

    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "12344",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => @headers

    expect(request.params).to have_key("location")
    expect(request.params).to have_key("api_key")

    expect(response).to be_successful
    expect(@user.favorites.last.location).to eq('Denver, CO')
    expect(response.status).to eq(204)
  end

  it 'creates errors out if api_key is wrong' do
    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "wrong",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => headers

    expect(request.params).to have_key("location")
    expect(request.params).to have_key("api_key")

    expect(response.status).to eq(401)
  end


  it 'shows a list of user favorites' do
    favorite_1 = @user.favorites.create(location: "denver,co")
    favorite_2 = @user.favorites.create(location: "chicago,il")

    get "/api/v1/favorites", :params => {"api_key": "12344",
      "controller"=>"api/v1/favorites",
      "action"=>"index"}, :headers => headers
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)

    attributes = data[:attributes][:body]
    expect(attributes.count).to eq(2)
    expect(attributes.first).to have_key(:location)
    expect(attributes.first[:location]).to eq("denver,co")

    expect(attributes.first).to have_key(:current_weather)
    expect(attributes.first[:current_weather]).to have_key(:time)
    expect(attributes.first[:current_weather]).to have_key(:summary)
    expect(attributes.first[:current_weather]).to have_key(:precipitation)
    expect(attributes.first[:current_weather]).to have_key(:temperature)
    expect(attributes.first[:current_weather]).to have_key(:humidity)
    expect(attributes.first[:current_weather]).to have_key(:uv_index)
    expect(attributes.first[:current_weather]).to have_key(:visibility)
  end

  it 'shows a list of user favorites' do
    favorite_1 = @user.favorites.create(location: "denver,co")
    favorite_2 = @user.favorites.create(location: "chicago,il")

    get "/api/v1/favorites", :params => {"api_key": "",
      "controller"=>"api/v1/favorites",
      "action"=>"index"}, :headers => headers

    expect(response.status).to eq(401)
  end
end
