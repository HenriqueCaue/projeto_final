FactoryBot.define do
  factory :headhunter do
    sequence(:email) { |n| "headhunter#{n}@test.com" }
    password { '1234567' }
  end
end
