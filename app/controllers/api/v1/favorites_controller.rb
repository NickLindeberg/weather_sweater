class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = Favorite.find_or_create_by(location: (params[:location]))
      success = user.user_favorites.create(favorite_id: favorite.id)
      render json: "Good Job", status: 204
    else
      render json: "Error", status: 401
    end
  end

end
