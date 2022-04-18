FactoryBot.define do
  factory :user, aliases: [:author] do
    login { Faker::Lorem.word }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "#{first_name}.#{last_name}@example#{n}.com" }

    # trait :manager do
    #   email "manager@cookbook.com"
    #   roles ["manager"]
    # end
  end
end
