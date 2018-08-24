class LunchRequest < ApplicationRecord
  validates :datetime, :suggested_duration, :lunch_type, presence: true
  validates :address, presence: true
  validates :address,
  exclusion: {
    in: ["Please put in your full address here."],
    message: "You can not save a request with the default address",
    allow_nil: false
  }

  belongs_to :user
  has_one :lunch_date
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  TYPES = ["casual", "professional"]
  def deactivate
    self.active = false
    self.save
  end

end
