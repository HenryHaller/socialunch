class LunchDate < ApplicationRecord
  belongs_to :user
  belongs_to :second_user
  belongs_to :restaurant
end
