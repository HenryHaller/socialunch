class LunchRequest < ApplicationRecord
  validates :datetime, :suggested_duration, :lunch_type, presence: true
  belongs_to :user
  belongs_to :lunch_date, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  TYPES = ["casual", "professional"]
  def deactivate
    self.active = false
    self.save
  end

end
