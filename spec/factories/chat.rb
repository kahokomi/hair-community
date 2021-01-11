FactoryBot.define do
  factory :chat do
    content { Faker::Lorem.characters(number: 20) }
    user
    room
  end
end