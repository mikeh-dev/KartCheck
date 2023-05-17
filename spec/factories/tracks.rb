FactoryBot.define do
  factory :track do
    sequence(:name) { |n| "Track #{n}" }  
  end
end
