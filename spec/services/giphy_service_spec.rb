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
      response = @giphyservice.get_gifs("denver,co")

      require "pry"; binding.pry

    end
  end
end
