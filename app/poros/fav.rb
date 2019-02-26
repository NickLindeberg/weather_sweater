class Fav

  def build(favorite)
    att = ForecastBuilder.new(favorite.location).currently
  end

end
