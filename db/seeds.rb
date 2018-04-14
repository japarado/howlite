# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create 10 Faculties
10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::name,
      :password => 'secret',
      :encrypted_password => 'secret',
      :user_type => 'FACULTY'
  )
end

10.times do
  User.create(
      :email => Faker::Internet.email,
      :name => Faker::name,
      :password => 'secret',
      :encrypted_password => 'secret',
      :user_type => 'HR'
  )
end