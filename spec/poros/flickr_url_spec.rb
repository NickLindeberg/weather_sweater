require 'rails_helper'

describe FlickrUrl do
  it 'creates url out of information' do
    data = {id: "8172043009",
          owner: "89631716@N07",
          secret: "3879f872e1",
          server: "8197",
          farm: 9,
          title: "Ireland, St Patricks Day Headdress ' Dublin Ireland.",
          ispublic: 1,
          isfriend: 0,
          isfamily: 0
        }

    url = FlickrUrl.new.build(data)
    expect(url).to eq("https://farm9.staticflickr.com/8197/8172043009_3879f872e1.jpg")
  end
end
