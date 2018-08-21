class LunchRequest < ApplicationRecord
  validates :datetime, :suggested_duration, :lunch_type, presence: true
  belongs_to :user
end
