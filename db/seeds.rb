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
        password: ENV['SEED_USER_PASSWORD'],
        username: "OS1126a",
        name: Faker::Name.name,
        age: 40,
        year: 15,
        hair_salon: "hairsalon OS",
        position: "店長",
        price: "4000",
        prefecture_id: 13,
        area_id: 1,
        city: "渋谷区",
        street: "渋谷1丁目11-3",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "SS0125a",
        name: Faker::Name.name,
        age: 39,
        year: 13,
        hair_salon: "hairsalon Show",
        position: "スタイリスト",
        price: "5000",
        prefecture_id: 13,
        city: "立川市",
        street: "柴崎町2丁目",
        area_id: 12,
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "AM1224a",
        name: Faker::Name.name,
        age: 38,
        job: "アパレル店員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "NK0617a",
        name: Faker::Name.name,
        age: 25,
        job: "エンジニア",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "MJ0830a",
        name: Faker::Name.name,
        age: 28,
        job: "営業マン",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "Hanachan6",
        name: Faker::Name.name,
        age: 26,
        year: 8,
        hair_salon: "cut Natsuki",
        position: "スタイリスト",
        price: "3000",
        prefecture_id: 13,
        city: "武蔵野市",
        street: "吉祥寺南町1丁目",
        area_id: 12,
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "Kenchan7",
        name: Faker::Name.name,
        age: 19,
        year: 10,
        hair_salon: "cut Natsuki",
        position: "アシスタント",
        price: "1500",
        prefecture_id: 13,
        city: "渋谷区",
        street: "代官山町",
        area_id: 6,
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "Eguu8yami",
        name: Faker::Name.name,
        age: 21,
        year: 3,
        hair_salon: "hairsalon Show",
        position: "ジュニアスタイリスト",
        price: "2000",
        prefecture_id: 13,
        city: "渋谷区",
        street: "神宮前5丁目",
        area_id: 3,
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "Kanekichi9",
        name: Faker::Name.name,
        age: 25,
        job: "会社員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: ENV['SEED_USER_PASSWORD'],
        username: "Tokachan10",
        name: Faker::Name.name,
        age: 28,
        job: "自営業",
        is_hairdresser: false,
      }
    ]
  )
  
  Tweet.create!(
    [
      {
        user_id: 1,
        body: "こんにちは！今日は寒いですね〜！こんな日はおうち美容日和！いろいろとご提案させていただきますので、ぜひはなしてみるからどうぞ！"
      },
      
      {
        user_id: 2,
        body: "サロンモデルさん募集中です！気になる方ははなしてみるでお声がけください！"
      },
      
      {
        user_id: 3,
        body: "今日は新作が入荷して忙しい一日でした...髪切りたいな〜"
      },
      
      {
        user_id: 4,
        body: "ヘアスタイルを変えたいけれど最近時間が取れないなあ、夜遅くまでやっている美容師さんぜひ声かけてください！"
      },
      
      {
        user_id: 5,
        body: "今日も働いた〜！なにかリフレッシュしたいなあ！"
      },
      
      {
        user_id: 6,
        body: "最近撮影に力をいれています！"
      },
      
      {
        user_id: 7,
        body: "モデルさん募集しています！ご興味のある方ははなしかけるからお気軽にどうぞ！"
      },
      
      {
        user_id: 8,
        body: "カットのテストに合格しました！！応援してくださったみなさんありがとうございました！"
      },
      
      {
        user_id: 9,
        body: "先日ヘアスタイルを変えたら評判がよかったです。うれしいな"
      },
      
      {
        user_id: 10,
        body: "新事業の立ち上げに伴い、心機一転髪型を変えたいなと思っています。お声がけお待ちしています！"
      }
    ]
  )
