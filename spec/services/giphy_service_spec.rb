require 'rails_helper'

describe GiphyService do
  before(:each) do
    @giphyservice = GiphyService.new
  end

  it 'exists' do

    expect(@giphyservice).to be_a(GiphyService)
  end

  it 'returns gifs based on search term' do
    VCR.use_cassette("giphy_service_spec") do
      response = @giphyservice.get_gif("denver,co")

      expect(response).to have_key(:id)
      expect(response).to have_key(:embed_url)
      ###lots of other things in this response but i'm only checking for the things I need
    end
  end
end
