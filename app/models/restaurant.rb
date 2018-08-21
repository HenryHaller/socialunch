class Restaurant < ApplicationRecord
  validates :address, :latitude, :longitude, :name, :description, :cuisine, :phone_number, presence: true
  has_many :lunch_requests
end
