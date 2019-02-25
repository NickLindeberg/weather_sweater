class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_secure_password

  def self.build(user_params)
    user_info = {}
    user_info[:email] = user_params["email"]
    user_info[:password] = user_params["password"]
    user_info[:password_confirmation] = user_params["password"]
    user_info[:api_key] = SecureRandom.uuid
    User.create(user_info)
  end
end
