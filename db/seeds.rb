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

# Assuming you have a User model
users = User.all

class CustomFaker < Faker::Base
  class << self
    def otk_make
      'OTK'
    end

    def otk_model
      %w[Tonykart Kosmic Expirit Gillard].sample
    end

    def otk_engine_number
      prefix = %w[CY HY].sample
      suffix = rand(1000..9999)
      "#{prefix}#{suffix}"
    end
  end
end

# Create Engines
50.times do
  engine = Engine.new(
    make: CustomFaker.otk_make,
    model: CustomFaker.otk_model,
    engine_number: CustomFaker.otk_engine_number
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
