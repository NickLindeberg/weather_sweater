class Favorite < ApplicationRecord
  validates_presence_of :location

  has_many :user_favorites
  has_many :users, through: :user_favorites, dependent: :destroy

end
