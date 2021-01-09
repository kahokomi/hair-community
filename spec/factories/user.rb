FactoryBot.define do
  factory :user, class: User do
    username                    {"komkom"}
    email                       {"kkk@gmail.com"}
    password                    {"00000000"}
    password_confirmation       {"00000000"}
    # name                        {"美容師A"}
    # year                        {4}
    # position                    {"スタイリスト"}
    # hair_salon                  {"DaB表参道"}
    # age                         {25}
    is_hairdresser              {true}
  end
  factory :other_user, class: User do
    username                    {"kimkim"}
    email                       {"ooo@gmail.com"}
    password                    {"00000000"}
    password_confirmation       {"00000000"}
    # name                        {"美容師A"}
    # year                        {4}
    # position                    {"スタイリスト"}
    # hair_salon                  {"DaB表参道"}
    # age                         {25}
    is_hairdresser              {false}
  end

end