FactoryBot.define do
  factory :tweet, class: Tweet do
    body  { Faker::Lorem.characters(number: 20) }
  end
end