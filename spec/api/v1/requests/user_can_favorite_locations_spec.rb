require 'rails_helper'

describe 'request' do
  it 'creates favorite location for user' do
    user = User.create(email: "nick@nick.com", password: "password", api_key: "12344")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "12344",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => headers

    expect(request.params).to have_key("location")
    expect(request.params).to have_key("api_key")

    expect(response).to be_successful
    expect(user.favorites.last.location).to eq('Denver, CO')
    expect(response.status).to eq(204)
  end

  it 'creates errors out if api_key is wrong' do
    user = User.create(email: "nick@nick.com", password: "password", api_key: "12344")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "wrong",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => headers

    expect(request.params).to have_key("location")
    expect(request.params).to have_key("api_key")

    expect(response.status).to eq(401)
  end
end
