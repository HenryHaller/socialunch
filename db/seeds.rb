# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

Tsuzumi = {
  email: "tsuzumi@gmail.com",
  first_name: "Tsuzumi",
  last_name: "Sato",
  bio: 'I am a student at Le Wagon.',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years)
}

Ableen = {
  email: "ableen@gmail.com",
  first_name: A"bleen",
  last_name: "Tai",
  bio: 'I am a student at Le Wagon. ',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years)
}

Henry = {
  email: "henry@gmail.com",
  first_name: "Henry",
  last_name: "Haller",
  bio: 'I am a student at Le Wagon. ',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years)
}

tsuzumi = User.new(Tsuzumi)
ableen = User.new(Ableen)
henry = User.new(Henry)

puts tsuzumi.errors.messages unless tsuzumi.save
puts ableen.errors.messages unless ableen.save
puts henry.errors.messages unless henry.save


"Made #{User.count} users"
