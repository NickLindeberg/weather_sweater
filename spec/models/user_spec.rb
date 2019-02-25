require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}

  context 'methods' do
    it 'returns api_key' do
      user_params = {
        email: "radandtherads@example.com",
        password: "radmobile",
        password_confirmation: "radmobile"
      }

      user = User.build(user_params)
      expect(user[:api_key]).to be_a(String)
    end
  end
end
