class Api::V1::SessionsController < ApplicationController

  def create
    session_user = User.find_by(email: sess_params[:email])
    response = {"api_key" => "#{session_user.api_key}"}
    if session_user && session_user.authenticate(params["password"])
      render json: response, status: 201
    else
      render json: "Login Failed", status: 401
    end
  end

  def sess_params
    params.permit(:email, :password)
  end

end
