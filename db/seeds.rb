require 'faker'

50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Assuming you have a User model
users = User.all

50.times do
  engine = Engine.new(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    engine_number: Faker::Number.number(digits: 5)
  )
  engine.user = users.sample
  engine.save!
end
