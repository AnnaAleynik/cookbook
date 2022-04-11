FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user@example#{n}.com" }
    # login { "Faker::Lorem.word" }
    login { Faker::Lorem.word }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }

    # trait :manager do
    #   email "manager@cookbook.com"
    #   roles ["manager"]
    # end
  end
end
