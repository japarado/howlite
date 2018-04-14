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
Faculty.create(:user_id => 1)

#create a constant HR
@hr_user = User.new
@hr_user.email = 'apc@mail.com'
@hr_user.name = 'Asia Pacific College'
@hr_user.password = 'secret'
@hr_user.user_type = 'HR'
@hr_user.save
Hr.create(:user_id => 2)

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

User.all.each do |user|
  if user.user_type 'FACULTY'
    Faculty.create(:user_id => user.id)
  else
    Hr.create(:user_id => user.id)
  end
end