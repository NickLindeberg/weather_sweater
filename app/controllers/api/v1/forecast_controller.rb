class Api::V1::ForecastController < ApplicationController

  def show
    render json: ForecastSerializer.new(ForecastBuilder.new(params[:location]))
  end

end
