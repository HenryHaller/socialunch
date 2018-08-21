# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.delete_all
User.delete_all
LunchRequest.delete_all
LunchDate.delete_all



puts "making restaurants"

6.times do |variable|
  Restaurant.create(address: Faker::Address.full_address,
  latitude: Faker::Address.latitude, longitude: Faker::Address.longitude,
  name: Faker::Pokemon.name, description: Faker::TheITCrowd.quote,
  cuisine: Faker::Superhero.power, phone_number: Faker::PhoneNumber.cell_phone)
end

puts "making users "

6.times do |variable|
  User.create(first_name: Faker::Dog.name,
    last_name: Faker::Cat.name, birthday: Faker::Date.birthday(18, 65), smoking: [true, false].sample,
    bio: Faker::TheFreshPrinceOfBelAir.quote)
end

puts "making lunch requests"
6.times do
  LunchRequest.create(datetime: Time.now, suggested_duration: [30, 60, 90, 120].sample, lunch_type: ["casual", "professional"].sample)
end

puts "making lunch dates"
6.times do |variable|
  LunchDate.create(user: User.all.sample, second_user: User.all.sample, restaurant: Restaurant.all.sample,
    begin: Time.now, suggested_duration: 60, lunch_type: ["casual", "professional"].sample)
end

"Made #{Restaurant.count} restaurants"
"Made #{User.count} users"
"Made #{LunchRequest.count} lunch requests"
"Made #{LunchDate.count} lunch dates"
