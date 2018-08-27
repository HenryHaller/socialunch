require "open-uri"
require 'json'

PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"

class MakeMatchesJob < ApplicationJob
  queue_as :default

  # def time_match(pair)
  #   t1 = pair[0].datetime.to_i
  #   t2 = pair[1].datetime.to_i
  #   (t1 - t2).abs <= ( 60 * 15 )
  # end

  def location_match(pair)
    pair[0].distance_from(pair[1]) <= 1.0
  end

  # def duration_match(pair)
  #   (pair[0].suggested_duration == pair[1].suggested_duration - 30) ||
  #   (pair[0].suggested_duration == pair[1].suggested_duration + 30) ||
  #   (pair[0].suggested_duration == pair[1].suggested_duration)
  # end

  # def type_match(pair)
  #   pair[0].lunch_type == pair[0].lunch_type
  # end

  def test_for_match (pair)
    # p pair
    # time = time_match(pair)
    location = location_match(pair)
    # duration = duration_match(pair)
    # type = type_match(pair)
    # p time, location, duration, type
    # time && location && duration && type
    location
  end

  def perform(*args)
    puts
    puts ">>>>>>>>>>> Running MakeMatchesJob <<<<<<<<<<<<<<<"
    puts
    # ActionCable.server.broadcast( "incoming_requests" , {
    #   lunch_date: "inside of the making matches job"
    # })

    requests = LunchRequest.where(active: true).to_a
    request_pairs = []
    while requests.length > 0
      r = requests.pop
      requests.each { |request| request_pairs << [request, r] }
    end
    request_pairs.select! { |pair| test_for_match(pair) }
    have_pairs = []
    delete_indexes = []
    request_pairs.each_with_index do |pair, index|
      if have_pairs.include?(pair[0]) || have_pairs.include?(pair[1])
        delete_indexes << index
      end
      pair.each do |request|
        have_pairs << request unless have_pairs.include?(request)
      end
    end
    # puts "delete indexes #{delete_indexes}"
    delete_indexes.reverse_each do |index|
      request_pairs.delete_at(index)
    end

    # puts request_pairs.count
    request_pairs.each do |pair|

      #get a restaurant id
      avg_lat = (pair[0].latitude + pair[1].latitude) / 2
      avg_lng = (pair[0].longitude + pair[1].longitude) / 2
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
      # puts "making lunch for #{pair}"
      lunch = LunchDate.new(
        request1: pair[0],
        request2: pair[1],
        gmaps_place_id: gmaps_place_id
        # restaurant: Restaurant.all.sample,
        # begin: Time.at(( pair[0].datetime.to_i + pair[1].datetime.to_i ) / 2),
        # suggested_duration: ( pair[0].suggested_duration + pair[1].suggested_duration ) / 2,
        # lunch_type: pair[0].lunch_type
          )
          if lunch.save
            puts
            puts
            puts
            puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Lunch successfully saved"
            p lunch
            # # ActionCable.server.broadcast("incoming_requests", {
            # #   lunch_date: ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> blah"
            # # })
            # ActionCable.server.broadcast( "incoming_requests" , {
            #   lunch_date: "we have saved a lunch"
            # })

            ActionCable.server.broadcast( "incoming_requests" , {
                                            lunch_date: lunch
            })
            puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> sent action cable'
            pair[0].lunch_date = lunch
            pair[1].lunch_date = lunch
            pair[0].save
            pair[1].save
            pair[0].deactivate
            pair[1].deactivate
          else
            puts lunch.errors.messages if lunch.errors.any?
          end


        end
        end
        end
