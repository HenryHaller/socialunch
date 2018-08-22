class LunchDate < ApplicationRecord
  belongs_to :request1, :class_name => 'LunchRequest'
  belongs_to :request2, :class_name => 'LunchRequest'
  belongs_to :restaurant

  validates :request1, :request2, :restaurant, :begin, :lunch_type, presence: true
end
