class FavBuilder
  attr_reader :user_id,
              :body

  def initialize(user)
    @user = user
    @user_id = user.id
    @favorites = user.favorites
  end

  def body
    favs = []
    @favorites.each do |favorite|
      favs << {
        location: favorite.location,
        current_weather: Fav.new.build(favorite)
      }
    end
    favs
  end
end
