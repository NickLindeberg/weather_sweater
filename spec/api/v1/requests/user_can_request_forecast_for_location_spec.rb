require 'rails_helper'

describe 'visitor or user can see a forecast' do
  it 'shows forcast for specific city' do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
  end
end
