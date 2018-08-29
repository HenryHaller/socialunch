require "open-uri"
require 'json'

PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"


class LunchDate < ApplicationRecord
  belongs_to :request1, :class_name => 'LunchRequest'
  belongs_to :request2, :class_name => 'LunchRequest'
  has_many :messages, dependent: :destroy
  has_many :photos, dependent: :destroy

  # belongs_to :restaurant

  validates :request1, :request2, presence: true
  # :restaurant, :begin, :lunch_type, presence: true
  validate :not_a_self_match
  def not_a_self_match
    self.request1.id != self.request2.id
  end

  # def set_photo(photoreference)
  #   params = {
  #     maxwidth: 400,
  #     photoreference: photoreference,
  #     key: ENV["GOOGLE_API_SERVER_KEY"]
  #   }
  #   lookup_url = PHOTO_REFERENCE_API_BASE + URI.encode_www_form(params)
  #   puts "ATTEMPTING URL LOOK UP!!!"
  #   puts lookup_url
  #   data = open(lookup_url).read
  #   # puts "<<<<<<<<<<<<<<"
  #   # # puts data
  #   # puts "<<<<<<<<<<<<<<"

  # end


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
    # p lookup_url
    # puts lookup_url
    data = JSON.parse(open(lookup_url).read)
    results = data["results"]
    result = results.sample
    puts "initializing the client"
    client = GooglePlaces::Client.new(ENV["GOOGLE_API_SERVER_KEY"])

    gmaps_place_id = result["place_id"]
    self.gmaps_place_id = gmaps_place_id
    spot = client.spot(gmaps_place_id)
    # top_photo =  result["photos"][0]
    # set_photo(top_photo["photo_reference"])
    # p result
    # p result["geometry"]
    # self.latitude = result["geometry"]["location"]["lat"]
    # self.longitude = result["geometry"]["location"]["lng"]
    # self.venue_name = result["name"]
    # self.vicinity = result["vicinity"]
    # pp spot
    self.latitude = spot.lat
    self.longitude = spot.lng
    self.venue_name = spot.name
    self.vicinity = spot.vicinity
    puts "adding photos"
    spot.photos.each do |photo|
      p photo
      photo = Photo.new(
        photo_reference: photo.photo_reference,
        photo_url: photo.fetch_url(400),
        html_attribution: photo.html_attributions[0],
        lunch_date: self
        )
      puts photo.errors.messages unless photo.save
    end

    # p results.photos

    # spot = client.spot(gmaps_place_id)
    # self.photo_url = spot.photos[0].fetch_url(800)

    # self.photo_reference = top_photo["photo_reference"]
  end
end
