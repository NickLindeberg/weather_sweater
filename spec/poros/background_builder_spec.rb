require 'rails_helper'

describe BackgroundBuilder do
  before(:each) do
    @location = "denver,co"
  end
  it 'exists' do
    VCR.use_cassette("builder_spec") do
      expect(BackgroundBuilder.new(@location)).to be_a(BackgroundBuilder)
    end
  end

  it 'builds link out of location' do
    VCR.use_cassette("builder_spec") do

      builder = BackgroundBuilder.new(@location)
      expect(builder.url).to be_a(String)
    end
  end
end
