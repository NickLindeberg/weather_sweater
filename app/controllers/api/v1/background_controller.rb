class Api::V1::BackgroundController < ApplicationController

  def show
    expires_in 60.minutes, :public => true
    render json: BackgroundSerializer.new(BackgroundBuilder.new(params[:location]))
  end

end
