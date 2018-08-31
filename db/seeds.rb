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
  bio: 'I am a graduate student at Tokyo University. I will attend medical school in the fall. I grew up in Malaysia and Shanghai. ',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 591
}
tsuzumi = User.new(Tsuzumi)
tsuzumi.photo = Rails.root.join("db/images/tsuzumi.jpeg").open
puts tsuzumi.errors.messages unless tsuzumi.save

Ableen = {
  email: "ableen@gmail.com",
  first_name: "Ableen",
  last_name: "Tai",
  bio: 'I am visiting Tokyo from San Francisco. I quit my job to travel the world. I have visited more than 30 countries. I have been doing Muay Thai for 10 years and plan to go to Thailand next month to fight.',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 434
}
ableen = User.new(Ableen)
ableen.photo = Rails.root.join("db/images/ableen.jpeg").open
puts ableen.errors.messages unless ableen.save

def make_lr(user)
  lr_ableen = LunchRequest.new(
    latitude: 35.6338503,
    longitude: 139.7082281,
    user: user,
    active: false
    )
  puts lr_ableen.errors.messages unless lr_ableen.save
  lr_ableen
end


Henry = {
  email: "henry@gmail.com",
  first_name: "Henry",
  last_name: "Haller",
  bio: 'I love to lunch. It is my favorite time of the day because I get to meet new people and enjoy delicous food.',
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: 858
}

henry = User.new(Henry)
henry.photo = Rails.root.join("db/images/ableen.jpeg").open
puts henry.errors.messages unless henry.save


Jan = {
  email: "jan@gmail.com",
  first_name: "Jan",
  last_name: "Hoga",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
jan = User.new(Jan)
jan.photo = Rails.root.join("db/images/jan.jpeg").open
puts jan.errors.messages unless jan.save

lr_jan = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: jan,
  active: false
  )
puts lr_jan.errors.messages unless lr_jan.save

ld = LunchDate.new(
  request1: lr_jan,
  request2: make_lr(ableen),
  begin: Time.now - 1.days
    )
ld.set_place
puts ld.errors.messages unless ld.save

Tania = {
  email: "tania@gmail.com",
  first_name: "Tania",
  last_name: "Perales",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
tania = User.new(Tania)
tania.photo = Rails.root.join("db/images/tania.jpeg").open
puts tania.errors.messages unless tania.save

lr_tania = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: tania,
  active: false
  )
puts lr_tania.errors.messages unless lr_tania.save

ld = LunchDate.new(
  request1: lr_tania,
  request2: make_lr(ableen),
  begin: Time.now - 2.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

David = {
  email: "david@gmail.com",
  first_name: "David",
  last_name: "Li",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
david = User.new(David)
david.photo = Rails.root.join("db/images/david.png").open
puts david.errors.messages unless david.save

lr_david = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: david,
  active: false
  )
puts lr_david.errors.messages unless lr_david.save

ld = LunchDate.new(
  request1: lr_david,
  request2: make_lr(ableen),
  begin: Time.now - 3.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

Hiroki = {
  email: "hiroki@gmail.com",
  first_name: "Hiroki",
  last_name: "Furuichi",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
hiroki = User.new(Hiroki)
hiroki.photo = Rails.root.join("db/images/hiroki.jpeg").open
puts hiroki.errors.messages unless hiroki.save

lr_hiroki = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: hiroki,
  active: false
  )
puts lr_hiroki.errors.messages unless lr_hiroki.save

ld = LunchDate.new(
  request1: lr_hiroki,
  request2: make_lr(ableen),
  begin: Time.now - 4.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

Caleb = {
  email: "caleb@gmail.com",
  first_name: "Caleb",
  last_name: "Finley",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
caleb = User.new(Caleb)
caleb.photo = Rails.root.join("db/images/caleb.jpeg").open
puts caleb.errors.messages unless caleb.save

lr_caleb = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: caleb,
  active: false
  )
puts lr_caleb.errors.messages unless lr_caleb.save
ld = LunchDate.new(
  request1: lr_caleb,
  request2: make_lr(ableen),
  begin: Time.now - 5.days
    )
ld.set_place

puts ld.errors.messages unless ld.save


Fumiko = {
  email: "fumiko@gmail.com",
  first_name: "Fumiko",
  last_name: "Toyoda",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
fumiko = User.new(Fumiko)
fumiko.photo = Rails.root.join("db/images/fumiko.jpeg").open
puts fumiko.errors.messages unless fumiko.save

lr_fumiko = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: fumiko,
  active: false
  )
puts lr_fumiko.errors.messages unless lr_fumiko.save
ld = LunchDate.new(
  request1: lr_fumiko,
  request2: make_lr(ableen),
  begin: Time.now - 6.days
    )
ld.set_place

puts ld.errors.messages unless ld.save


George = {
  email: "george@gmail.com",
  first_name: "George",
  last_name: "Walden",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
george = User.new(George)
george.photo = Rails.root.join("db/images/george.jpeg").open
puts george.errors.messages unless george.save

lr_george = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: george,
  active: false
  )
puts lr_george.errors.messages unless lr_george.save

ld = LunchDate.new(
  request1: lr_george,
  request2: make_lr(ableen),
  begin: Time.now - 7.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

Kat = {
  email: "kat@gmail.com",
  first_name: "Kat",
  last_name: "Ariola",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
kat = User.new(Kat)
kat.photo = Rails.root.join("db/images/kat.jpeg").open
puts kat.errors.messages unless kat.save

lr_kat = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: kat,
  active: false
  )
puts lr_kat.errors.messages unless lr_kat.save
ld = LunchDate.new(
  request1: lr_kat,
  request2: make_lr(ableen),
  begin: Time.now - 8.days
    )
ld.set_place

puts ld.errors.messages unless ld.save


Larry = {
  email: "larry@gmail.com",
  first_name: "Larry",
  last_name: "Nevins",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
larry = User.new(Larry)
larry.photo = Rails.root.join("db/images/larry.jpeg").open
puts larry.errors.messages unless larry.save

lr_larry = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: larry,
  active: false
  )
puts lr_larry.errors.messages unless lr_larry.save
ld = LunchDate.new(
  request1: lr_larry,
  request2: make_lr(ableen),
  begin: Time.now - 9.days
    )
ld.set_place

puts ld.errors.messages unless ld.save


Nozomi = {
  email: "nozomi@gmail.com",
  first_name: "Nozomi",
  last_name: "Ishii",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
nozomi = User.new(Nozomi)
nozomi.photo = Rails.root.join("db/images/nozomi.png").open
puts nozomi.errors.messages unless nozomi.save

lr_nozomi = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: nozomi,
  active: false
  )
puts lr_nozomi.errors.messages unless lr_nozomi.save

ld = LunchDate.new(
  request1: lr_nozomi,
  request2: make_lr(ableen),
  begin: Time.now - 10.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

Takuma = {
  email: "takuma@gmail.com",
  first_name: "Takuma",
  last_name: "Naruke",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
takuma = User.new(Takuma)
takuma.photo = Rails.root.join("db/images/takuma.jpeg").open
puts takuma.errors.messages unless takuma.save

lr_takuma = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: takuma,
  active: false
  )
puts lr_takuma.errors.messages unless lr_takuma.save

ld = LunchDate.new(
  request1: lr_takuma,
  request2: make_lr(ableen),
  begin: Time.now - 11.days
    )
ld.set_place

puts ld.errors.messages unless ld.save

Matt = {
  email: "matt@gmail.com",
  first_name: "Matt",
  last_name: "Frazier",
  bio: "Exciting person who loves to meet new people!",
  password: "123456",
  birthday: (Time.now - (18..65).to_a.sample.years),
  score: (300..999).to_a.sample
}
matt = User.new(Matt)
matt.photo = Rails.root.join("db/images/matt.jpeg").open
puts matt.errors.messages unless matt.save

lr_matt = LunchRequest.new(
  latitude: 35.6338503,
  longitude: 139.7082281,
  user: matt,
  active: false
  )
puts lr_matt.errors.messages unless lr_matt.save


ld = LunchDate.new(
  request1: lr_matt,
  request2: make_lr(ableen),
  begin: Time.now - 12.days
    )
ld.set_place

puts ld.errors.messages unless ld.save








"Made #{User.count} users"
