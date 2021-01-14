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
        username: "OS1126a",
        name: Faker::Name.name,
        age: 40,
        year: 15,
        hair_salon: "hairsalon OS",
        position: "店長",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password2",
        username: "SS0125a",
        name: Faker::Name.name,
        age: 39,
        year: 13,
        hair_salon: "hairsalon Show",
        position: "スタイリスト",
        is_hairdresser: true
      },

      {
        email: Faker::Internet.email,
        password: "Password3",
        username: "AM1224a",
        name: Faker::Name.name,
        age: 38,
        job: "アパレル店員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password4",
        username: "NK0617a",
        name: Faker::Name.name,
        age: 25,
        job: "エンジニア",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password5",
        username: "MJ0830a",
        name: Faker::Name.name,
        age: 28,
        job: "営業マン",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password6",
        username: "Hanachan6",
        name: Faker::Name.name,
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
        age: 25,
        job: "会社員",
        is_hairdresser: false,
      },

      {
        email: Faker::Internet.email,
        password: "Password10",
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
