# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(
    [
      {
        email: Faker::Internet.email,
        password: "Password1",
        username: "Onoarashi1",
        name: Faker::Name.name,
        sex: "男",
        age: 40,
        year: 15,
        hair_salon: "hairsalon OS",
        position: "店長",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password2",
        username: "Sakuraiarashi2",
        name: Faker::Name.name,
        sex: "女",
        age: 39,
        year: 13,
        hair_salon: "hairsalon Show",
        position: "スタイリスト",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password3",
        username: "Aibaarashi3",
        name: Faker::Name.name,
        sex: "男",
        age: 38,
        job: "アパレル店員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password4",
        username: "Ninoarashi4",
        name: Faker::Name.name,
        sex: "女",
        age: 25,
        job: "フリーター",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password5",
        username: "MJarashi5",
        name: Faker::Name.name,
        sex: "女",
        age: 28,
        job: "看護師",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password6",
        username: "Hanachan6",
        name: Faker::Name.name,
        sex: "女",
        age: 26,
        year: 8,
        hair_salon: "cut Natsuki",
        position: "スタイリスト",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password7",
        username: "Kenchan7",
        name: Faker::Name.name,
        sex: "男",
        age: 19,
        year: 10,
        hair_salon: "cut Natsuki",
        position: "アシスタント",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password8",
        username: "Eguu8yami",
        name: Faker::Name.name,
        sex: "男",
        age: 21,
        year: 3,
        hair_salon: "hairsalon Show",
        position: "ジュニアスタイリスト",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password9",
        username: "Kanekichi9",
        name: Faker::Name.name,
        sex: "男",
        age: 25,
        job: "会社員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password10",
        username: "Tokachan10",
        name: Faker::Name.name,
        sex: "女",
        age: 28,
        job: "自営業",
        is_hairdresser: false,
      }
    ]
  )
