require 'faker'

# Create Admin User
User.create(
  name: 'Admin User',
  email: 'mikeh112@hotmail.com',
  password: 'password'
)

# Create Regular Users
50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

class CustomFaker < Faker::Base
  class << self
    def make
      %w[Rotax IAME Honda].sample
    end

    def model
      %w[Mini Junior Senior].sample
    end

    def engine_number
      rand(100000..999999)
    end
  end
end

# Create Engines
50.times do
  engine = Engine.new(
    make: CustomFaker.make,
    model: CustomFaker.model,
    engine_number: CustomFaker.engine_number
  )
  engine.user = users.sample
  engine.save!
end

# Create Tracks with Attached Images, Logo, and Pictures
10.times do
  track = Track.create(
    name: Faker::Address.city,
    overview: Faker::Lorem.paragraph,
    website: Faker::Internet.url,
    length: rand(1000..2000),
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address
  )
  
  track.image.attach(io: URI.open(Faker::LoremFlickr.image(size: "800x600", search_terms: ['race', 'track'])), filename: 'image.jpg')
  track.logo.attach(io: URI.open(Faker::LoremFlickr.image(size: "400x400", search_terms: ['logo', 'brand'])), filename: 'logo.jpg')
  
  3.times do
    track.pictures.attach(io: URI.open(Faker::LoremFlickr.image(size: "800x600", search_terms: ['race', 'track'])), filename: 'picture.jpg')
  end
end

users = User.all

class CustomFaker < Faker::Base
  class << self
    def chassis_name
      Faker::Name.first_name
    end

    def chassis_make
      %w[OTK].sample
    end

    def chassis_model
      %w[Kosmic TonyKart Gillard Expirit].sample
    end

    def chassis_number
      prefix = %w[CY HY].sample
      suffix = rand(1000..9999)
      "#{prefix}#{suffix}"
    end

    def chassis_colour
      Faker::Color.color_name
    end

    def chassis_notes
      Faker::Lorem.sentence
    end

    def chassis_year
      rand(1990..2023)
    end
  end
end

# Create Chassis
50.times do
  chassis = Chassis.new(
    name: CustomFaker.chassis_name,
    make: CustomFaker.chassis_make,
    model: CustomFaker.chassis_model,
    number: CustomFaker.chassis_number,
    colour: CustomFaker.chassis_colour,
    notes: CustomFaker.chassis_notes,
    year: CustomFaker.chassis_year
  )
  chassis.user = users.sample
  chassis.save!
end