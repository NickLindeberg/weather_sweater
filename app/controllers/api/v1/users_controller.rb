class Api::V1::UsersController < ApplicationController
  def create
    user = User.build(user_params)
    response = {"api_key" => "#{user.api_key}"}
    render json: response, status: 201
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
