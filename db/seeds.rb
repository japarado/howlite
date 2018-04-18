# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create a constant FACULTY
@faculty_user = User.new
@faculty_user.email = 'pamity@mail.com'
@faculty_user.name = 'Pamity'
@faculty_user.password = 'secret'
@faculty_user.user_type = 'FACULTY'
@faculty_user.save

#create a constant HR
@hr_user = User.new
@hr_user.email = 'apc@mail.com'
@hr_user.name = 'Asia Pacific College'
@hr_user.password = 'secret'
@hr_user.user_type = 'HR'
@hr_user.save

# create 10 users FACULTY
10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::Name.name,
      :password => 'secret',
      :user_type => 'FACULTY'
  )
end

10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::Name.name,
      :password => 'secret',
      :user_type => 'HR'
  )
end

#insert each user type into their respective tables and create profiles for them
regions = ['NCR', 'Calabarzon', 'Ilocos',
           'Cagayan Valley', 'Central Luzon', 'Mimaropa',
           'Bicol', 'CAR', 'Western Visayas',
           'Western Visayas']
User.all.each do |user|
  Profile.create(
      :user_id => user.id,
      :picture => 'http://lorempixel.com/400/200/people',
      :contact_number => '+639' + Faker::Number.number(9),
      :description => Faker::HitchhikersGuideToTheGalaxy.quote,
      :dob => Faker::Date.birthday(21, 55),
      :region => regions.sample,
      :city => Faker::Address.city,
      :street_address => Faker::Address.street_address,
      )
  if user.user_type == 'FACULTY'
    Faculty.create(:user_id => user.id)
  else
    Hr.create(:user_id => user.id)
  end
end

#create a job for each HR
Hr.all.each do |hr|
  Job.create(
      :hr_id => hr.id,
      :title => "Need professor to teach" + Faker::Hacker.ingverb + " " + Faker::Hacker.noun,
      :job_type => "FT",
      :salary => Faker::Number.decimal(5),
      :desc => Faker::SiliconValley.motto,
      )
  Job.create(
      :hr_id => hr.id,
      :title => "Need professor to teach" + Faker::Hacker.ingverb + " " + Faker::Hacker.noun,
      :job_type => "PT",
      :salary => Faker::Number.decimal(5),
      :desc => Faker::SiliconValley.motto,
      )
end