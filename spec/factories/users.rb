FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "username#{n}@example.com" }
    sequence(:name) { |n| "User #{n}" }
    password { 'password' }
    
    trait :admin do
      admin { true }
    end
  end
end

