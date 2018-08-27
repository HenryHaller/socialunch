require "open-uri"
require 'json'

PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"


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

  def set_place
    avg_lat = (self.request1.latitude + self.request2.latitude) / 2
    avg_lng = (self.request1.longitude + self.request2.longitude) / 2
    params = {
    location: "#{avg_lat},#{avg_lng}",
    radius: 700,
    type: "restaurant",
    maxprice: 2,
    key: ENV["GOOGLE_API_SERVER_KEY"],
    }
    lookup_url = PLACES_API_BASE + URI.encode_www_form(params)
    # puts lookup_url
    data = JSON.parse(open(lookup_url).read)
    results = data["results"]
    gmaps_place_id = results.sample["place_id"]
    self.gmaps_place_id = gmaps_place_id
  end
end
