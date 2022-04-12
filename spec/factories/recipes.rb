FactoryBot.define do
  factory :recipe do
    association :author, factory: :user
    title { Faker::Food.dish }
    content { Faker::Food.description }
  end
  # dessert 
end
