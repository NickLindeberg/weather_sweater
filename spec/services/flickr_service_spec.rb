require 'rails_helper'

describe 'Flickr service' do
  before(:each) do
    @fservice = FlickrService.new
  end

  it 'exists' do
    VCR.use_cassette("flickr_service_spec") do

      expect(@fservice).to be_a(FlickrService)
    end
  end

  it 'picks random photo' do
    VCR.use_cassette("flickr_service_spec") do
      location = "denver,co"

      random_photo = @fservice.get_image(location)
      expect(random_photo).to have_key(:id)
      expect(random_photo).to have_key(:owner)
      expect(random_photo).to have_key(:secret)
      expect(random_photo).to have_key(:server)
      expect(random_photo).to have_key(:farm)
      expect(random_photo).to have_key(:title)
      expect(random_photo).to have_key(:ispublic)
    end
  end
end
