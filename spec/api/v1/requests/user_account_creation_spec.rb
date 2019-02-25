require 'rails_helper'

describe 'user account creation' do
  it 'registers a new user' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/users", :params => {"email"=>"radandtherads@example.com",
       "password"=>"radmobile",
       "password_confirmation"=>"radmobile",
       "controller"=>"api/v1/users",
       "action"=>"create"}, :headers => headers

    expect(request.params).to have_key("email")
    expect(request.params).to have_key("password")
    expect(request.params).to have_key("password_confirmation")

    expect(response).to be_successful
    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash.keys).to include(:api_key)
    expect(response.status).to eq(201)
  end
end
