class MakeMatchesJob < ApplicationJob
  queue_as :default

  def time_match(pair)
    t1 = pair[0].datetime.to_i
    t2 = pair[1].datetime.to_i
    (t1 - t2).abs <= ( 60 * 15 )
  end

  def location_match(pair)
    pair[0].distance_from(pair[1]) <= 0.6
  end

  def duration_match(pair)
    (pair[0].suggested_duration == pair[1].suggested_duration - 30) ||
    (pair[0].suggested_duration == pair[1].suggested_duration + 30) ||
    (pair[0].suggested_duration == pair[1].suggested_duration)
  end

  def type_match(pair)
    pair[0].lunch_type == pair[0].lunch_type
  end

  def test_for_match (pair)
    # p pair

    time = time_match(pair)
    location = location_match(pair)
    duration = duration_match(pair)
    type = type_match(pair)
    # p time, location, duration, type
    time && location && duration && type
  end

  def perform(*args)
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
    puts "delete indexes #{delete_indexes}"
    delete_indexes.reverse_each do |index|
      request_pairs.delete_at(index)
    end

    puts request_pairs.count
    request_pairs.each do |pair|
      puts "making lunch for #{pair}"
      lunch = LunchDate.new(
        user: pair[0].user,
        second_user: pair[1].user,
        restaurant: Restaurant.all.sample,
        begin: Time.at(( pair[0].datetime.to_i + pair[1].datetime.to_i ) / 2),
        suggested_duration: ( pair[0].suggested_duration + pair[1].suggested_duration ) / 2,
        lunch_type: pair[0].lunch_type
        )
      lunch.save
      puts lunch.errors.messages if lunch.errors.any?
      p lunch
    end
  end
end



