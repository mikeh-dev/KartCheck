# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
