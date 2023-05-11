FactoryBot.define do
  factory :user do
    email { 'username@example.com' }
    password { 'password' }
    id { 2 }
  end
end