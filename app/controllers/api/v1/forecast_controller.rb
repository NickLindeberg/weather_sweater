class Api::V1::ForecastController < ApplicationController

  def show
    expires_in 60.minutes, :public => true
    render json: ForecastSerializer.new(ForecastBuilder.new(params[:location]))
  end

end
