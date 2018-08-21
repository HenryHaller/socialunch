class LunchDate < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :second_user, :class_name => 'User'
  belongs_to :restaurant

  validates :user, :second_user, :restaurant, :begin, :lunch_type, presence: true
end
