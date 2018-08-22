LunchDate.delete_all
# LunchRequest.delete_all

# l = LunchRequest.new(
#   datetime: Time.now,
#   suggested_duration: 30,
#   lunch_type: "casual",
#   user: User.first,
#   address: "southfield drive, williston, vt",
#   latitude: 44.4462195,
#   longitude: -73.0711349389535

#   )
# l.save
# puts l.errors.messages if l.errors.any?

# l = LunchRequest.new(
#   datetime: Time.now,
#   suggested_duration: 30,
#   lunch_type: "casual",
#   user: User.last,
#   address: "southfield drive, williston, vt",
#   latitude: 44.4462195,
#   longitude: -73.0711349389535
#   )
# l.save
# puts l.errors.messages if l.errors.any?

# l = LunchRequest.new(
#   datetime: Time.now,
#   suggested_duration: 30,
#   lunch_type: "casual",
#   user: User.last,
#   address: "southfield drive, williston, vt",
#   latitude: 44.4462195,
#   longitude: -73.0711349389535
#   )
# l.save
# puts l.errors.messages if l.errors.any?


puts LunchDate.count == 0

MakeMatchesJob.perform_now

puts LunchDate.count == 1
puts "we have #{LunchDate.count} lunchdates scheduled"
