class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavSerializer.new(FavBuilder.new(user)), status: 200
    else
      render json: "Unauthorized", status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = Favorite.find_or_create_by(location: (params[:location]))
      success = user.user_favorites.create(favorite_id: favorite.id)
      render json: "Favorite Created", status: 204
    else
      render json: "Error", status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user
      fav = user.favorites.find_by(location: params[:location])
      fav.destroy
      render json: "Deleted", status: 204
    else
      render json: "Error", status: 404
    end
  end
end
