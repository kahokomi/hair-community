FactoryBot.define do
  factory :user, class: User do
    username                    { "Testuser1" }
    email                       { Faker::Internet.email }
    password                    { "Testuser1" }
    password_confirmation       { "Testuser1" }
    name                        { Faker::Name.name }
    job                         { Faker::Lorem.characters(number: 5) }
    is_hairdresser              { false }
  end
  factory :hairdresser, class: User do
    username                    { "Testuser2" }
    email                       { Faker::Internet.email }
    password                    { "Testuser2" }
    password_confirmation       { "Testuser2" }
    name                        { Faker::Name.name }
    year                        { 4 }
    position                    { Faker::Lorem.characters(number: 5) }
    hair_salon                  { Faker::Lorem.characters(number: 5) }
    prefecture_id               { 13 }
    area_id                     { 1 }
    city                        { "渋谷区" }
    street                      { "渋谷1丁目11-3" }
    is_hairdresser              { true }
  end
end
