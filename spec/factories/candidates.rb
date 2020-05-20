FactoryBot.define do
  factory :candidate do
    sequence(:email) { |n| "candidate#{n}@test.com" }
    password { '1234567' }
  end
end
