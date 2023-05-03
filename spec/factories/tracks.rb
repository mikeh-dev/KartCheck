FactoryBot.define do
  factory :track do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    opening_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    closing_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    overview { Faker::Lorem.paragraph }
    website { Faker::Internet.url }
    length { Faker::Number.between(from: 100, to: 10000) }

    after(:build) do |track|
      track.images.attach([
        {
          io: File.open(Rails.root.join('app', 'assets', 'images', 'JHP_1590.jpg')),
          filename: 'JHP_3131.jpg'
        },
        {
          io: File.open(Rails.root.join('app', 'assets', 'images', 'JHP_1665.jpg')),
          filename: 'JHP_2802.jpg'
        }
      ])
    end
  end
end