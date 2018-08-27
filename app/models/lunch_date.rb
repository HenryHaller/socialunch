class LunchDate < ApplicationRecord
  belongs_to :request1, :class_name => 'LunchRequest'
  belongs_to :request2, :class_name => 'LunchRequest'
  # belongs_to :restaurant

  validates :request1, :request2, presence: true
  # :restaurant, :begin, :lunch_type, presence: true
  validate :not_a_self_match
  def not_a_self_match
    self.request1.id != self.request2.id
  end
end
