require 'rails_helper'

describe 'Gif request' do
  it 'shows json response with gify urls' do
    VCR.use_cassette("gifs_request_spec") do
      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GOOGLE_API_KEY"]}")
                  .to_return(body: File.read("./spec/fixtures/geocode_response.json"))

      stub_request(:get, "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392358,-104.990251")
                  .to_return(body: File.read("./spec/fixtures/darksky_response.json"))

      get '/api/v1/gifs?location=denver,co'

      expect(response).to be_successful
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      atts = data[:attributes]
      expect(atts).to have_key(:images)
      expect(atts).to have_key(:copyright)
      expect(atts[:copyright]).to eq("2019")
      expect(atts[:images].count).to eq(8)
      expect(atts[:images][0]).to have_key(:time)
      expect(atts[:images][0]).to have_key(:summary)
      expect(atts[:images][0]).to have_key(:url)

      expect(atts[:images][0][:time]).to eq(1551078000)
      expect(atts[:images][0][:summary]).to eq("Mostly cloudy until evening")
      expect(atts[:images][0][:url]).to eq("https://giphy.com/embed/63xBFHKNVjZlu")
    end
  end
end


# You will be building an API that will use weather data from the Dark Sky API in order to provide animated GIFs using the Giphy API.
# Your endpoint should accept GET requests like this:  `/api/v1/gifs?location=denver,co`
# And it should respond like this:
# ```
# {
#   data: {
#     images: [
#       {
#         time: "1541487600",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541127600",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "2381487600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]
#   }
#   copyright: "2019"
# }
# ```
# Note: Each <GIPHY_URL_GOES_HERE>  is a link to a different gif that is dependent on the weather. The time should also be different. The above example is provided for guidance about what the general structure of the data you are providing should look like.
