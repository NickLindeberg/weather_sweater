require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it {should validate_presence_of(:location)}
  it {should have_many(:user_favorites)}
  it {should have_many(:users)}
end
