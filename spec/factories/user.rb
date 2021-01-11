FactoryBot.define do
  factory :user, class: User do
    username                    { Faker::Lorem.characters(number: 6) }
    email                       { Faker::Internet.email }
    password                    {"00000000"}
    password_confirmation       {"00000000"}
    name                        { Faker::Name.name }
    job                         { Faker::Lorem.characters(number: 5) }
    is_hairdresser              {false}
  end
  factory :hairdresser, class: User do
    username                    { Faker::Lorem.characters(number: 6) }
    email                       { Faker::Internet.email }
    password                    {"00000000"}
    password_confirmation       {"00000000"}
    name                        { Faker::Name.name }
    year                        {4}
    position                    { Faker::Lorem.characters(number: 5) }
    hair_salon                  { Faker::Lorem.characters(number: 5) }
    is_hairdresser              {true}
  end

end