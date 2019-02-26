class Gifs
  attr_reader :time,
              :summary,
              :url

  def initialize(days)
    @time = days[:time]
    @summary = days[:summary].gsub(/[^0-9a-z ]/i, '')
    @url = GiphyService.new.get_gif(@summary)[:embed_url]
  end
end
