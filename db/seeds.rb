# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 10 users FACULTY
10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::name,
      :password => 'secret',
      :user_type => 'FACULTY'
  )
end

=begin
User.all.each do |user|
  Faculty.create(:user_id => user.id)
end
=end

10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::name,
      :password => 'secret',
      :user_type => 'HR'
  )
end