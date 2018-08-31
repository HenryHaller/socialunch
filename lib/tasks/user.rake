namespace :user do
  desc "creates admin user for default messagess"
  task create_admin: :environment do
    admin = {
      email: "system@gmail.com",
      first_name: "system",
      last_name: "systemlast",
      bio: 'I am a robot',
      password: "123456",
      birthday: (Time.now - (18..65).to_a.sample.years),
      score: 591,
      id: 1000
    }
    admin = User.new(admin)
    admin.photo = Rails.root.join("db/images/admin.png").open
    puts admin.errors.messages unless admin.save

  end

end
