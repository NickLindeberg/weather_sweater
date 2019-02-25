require 'rails_helper'

describe Gifs do
  it 'pulls information from hash and creates a gif' do
    VCR.use_cassette("gifs_request_spec") do
      weather_data = {:time=>1551078000,
                      :summary=>"Mostly cloudy until evening."
                    }
      gif = Gifs.new(weather_data)
      expect(gif.summary).to eq("Mostly cloudy until evening")
      expect(gif.time).to eq(1551078000)
      expect(gif.url).to eq("https://giphy.com/embed/63xBFHKNVjZlu")
    end
  end
end
