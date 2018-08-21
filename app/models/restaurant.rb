class Restaurant < ApplicationRecord
  validates :address, :latitude, :longitude, :name, :description, :cuisine, :phone_number, presence: true

end
