FactoryBot.define do
  factory :user, aliases: [:author] do
    sequence(:login) { |n| "#{Faker::Internet.username}#{n}" }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "#{first_name}.#{last_name}@example#{n}.com" }

    factory :admin do
      first_name { Faker::Name.first_name }
      last_name { "Admin" }
      roles { %w(manager coordinator moderator) }
    end

    factory :manager do
      first_name { Faker::Name.first_name }
      last_name { "Manager" }
      roles { %w(manager) }
    end

    factory :moderator do
      first_name { Faker::Name.first_name }
      last_name { "Moderator" }
      roles { %w(moderator) }
    end
  end
end
