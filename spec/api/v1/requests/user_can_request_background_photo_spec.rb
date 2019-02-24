require 'rails_helper'

describe 'flickr background image' do
  it 'shows random image based on search params' do
    stub_request(:get, "https://api.flickr.com/services/rest/?api_key=#{ENV['FLICKR_API_KEY']}&format=json&method=flickr.photos.search&nojsoncallback=1&tags=denver,co")
                .to_return(body: File.read("./spec/fixtures/flickr_response.json"))

    get "/api/v1/backgrounds?location=denver,co"

    flickr_response = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(flickr_response).to have_key(:id)
    expect(flickr_response).to have_key(:type)
    expect(flickr_response).to have_key(:attributes)
    expect(flickr_response[:attributes]).to have_key(:url)
  end
end
