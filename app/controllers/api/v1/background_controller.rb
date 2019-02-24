class Api::V1::BackgroundController < ApplicationController

  def show
    render json: BackgroundSerializer.new(BackgroundBuilder.new(params[:location]))
  end

end
