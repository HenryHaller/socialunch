# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LunchDate.delete_all
User.delete_all
Restaurant.delete_all
LunchRequest.delete_all


puts "making restaurants"
6.times do |variable|
  Restaurant.create(address: Faker::Address.full_address,
                    latitude: Faker::Address.latitude, longitude: Faker::Address.longitude,
                    name: Faker::Pokemon.name, description: Faker::TheITCrowd.quote,
                    cuisine: Faker::Superhero.power, phone_number: Faker::PhoneNumber.cell_phone)
end
puts "made #{Restaurant.count} restaurants"

puts "making users "
6.times do |variable|
  u = User.new(
    email: "test#{variable}@gmail.com",
    password: "123456",
    first_name: Faker::Dog.name,
    last_name: Faker::Cat.name,
    birthday: (Time.now - (18..65).to_a.sample.years),
  bio: Faker::TheFreshPrinceOfBelAir.quote)
  u.save
  puts u.errors.messages if u.errors.any?

end
puts "made #{User.count} users"


puts "making lunch requests"
User.all.each do |user|
  l = LunchRequest.create(
    datetime: Time.now,
    suggested_duration: [30, 60, 90, 120].sample,
    lunch_type: ["casual", "professional"].sample,
    user: user
  )
  l.save
  puts l.errors.messages if l.errors.any?
end
puts "made #{LunchRequest.count} lunch requests"

puts "making lunch dates"

MakeMatchesJob.perform_now
# 6.times do |variable|
#   LunchDate.create(user: User.all.sample, second_user: User.all.sample, restaurant: Restaurant.all.sample,
#     begin: Time.now, suggested_duration: 60, lunch_type: ["casual", "professional"].sample)
# end
puts "made #{LunchDate.count} lunch dates"

"Made #{Restaurant.count} restaurants"
"Made #{User.count} users"
"Made #{LunchRequest.count} lunch requests"
# "Made #{LunchDate.count} lunch dates"
