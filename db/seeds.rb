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

# constant faculty
User.create(
    :email => 'eugenebdelfin@gmail.com',
    :name => 'Eugene Delfin',
    :password => 'secret',
    :user_type => 'FACULTY',
    )
User.create(
    :email => 'pamity@mail.com',
    :name => 'Pamity',
    :password => 'secret',
    :user_type => 'FACULTY',
    )

#constant HR
User.create(
    :email => 'thegreatkenway@gmail.com',
    :name => 'Kenway',
    :password => 'secret',
    :user_type => 'HR',
    )
User.create(
    :email => 'apc@mail.com',
    :name => 'Asia Pacific College',
    :password => 'secret',
    :user_type => 'HR',
    )


#sort users into their respective tables
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

# create two jobs for each HR
Hr.all.each do |hr|
  Job.create(
      :hr_id => hr.id,
      :title => "Need professor to teach " + Faker::Hacker.ingverb + " " + Faker::Hacker.noun,
      :job_type => "FT",
      :salary => Faker::Number.decimal(5),
      :desc => Faker::SiliconValley.motto,
      )
  Job.create(
      :hr_id => hr.id,
      :title => "Need professor to teach " + Faker::Hacker.ingverb + " " + Faker::Hacker.noun,
      :job_type => "PT",
      :salary => Faker::Number.decimal(5),
      :desc => Faker::SiliconValley.motto,
      )
end