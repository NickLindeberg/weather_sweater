class Api::V1::GifsController < ApplicationController

  def index
    render json: GifSerializer.new(GifBuilder.new(params[:location]))
  end

end
