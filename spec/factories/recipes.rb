FactoryBot.define do
  factory :recipe do
    author
    title { Faker::Food.dish }
    content { Faker::Food.description }
  end

  # TODO: dessert
end
