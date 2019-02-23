require 'rails_helper'

describe 'visitor or user can see a forecast' do
  it 'shows forcast for specific city' do
    get "/api/v1/forecast?location=denver,co"
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data[:id]).to eq("denver,co")
    expect(data[:type]).to eq("forecast")
  end
end
