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

50.times do
  engine = Engine.new(
    make: CustomFaker.otk_make,
    model: CustomFaker.otk_model,
    engine_number: CustomFaker.otk_engine_number
  )
  engine.user = users.sample
  engine.save!
end
