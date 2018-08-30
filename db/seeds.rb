# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
LunchRequest.destroy_all
LunchDate.destroy_all

Tsuzumi = {
  email: "tsuzumi@gmail.com",
  first_name: "Tsuzumi",
  last_name: "Sato",
  bio: 'I am a graduate student at Tokyo University. I will attend medical school in the fall.',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 591
}

Ableen = {
  email: "ableen@gmail.com",
  first_name: "Ableen",
  last_name: "Tai",
  bio: 'I am visiting Tokyo from San Francisco. I quit my job to travel the world. I have visited more than 30 countries',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 434
}

Henry = {
  email: "henry@gmail.com",
  first_name: "Henry",
  last_name: "Haller",
  bio: 'I love to lunch. It is my favorite time of the day because I get to meet new people and enjoy delicous food.',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 858
}

tsuzumi = User.new(Tsuzumi)
tsuzumi.photo = Rails.root.join("db/images/tsuzumi.jpeg").open
ableen = User.new(Ableen)
ableen.photo = Rails.root.join("db/images/ableen.jpeg").open
henry = User.new(Henry)
henry.photo = Rails.root.join("db/images/ableen.jpeg").open

puts tsuzumi.errors.messages unless tsuzumi.save
puts ableen.errors.messages unless ableen.save
puts henry.errors.messages unless henry.save


"Made #{User.count} users"
