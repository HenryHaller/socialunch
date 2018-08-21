class LunchDate < ApplicationRecord
  belongs_to :user
  belongs_to :second_user
  belongs_to :restaurant

  validates :user, :second_user, :restaurant, :begin, :lunch_type, presence: true
end
