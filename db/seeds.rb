# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Area.create!(
    [
      {
        id: 1,
        name: "センター街・神南・公園通り・神泉・道玄坂"
      },

      {
        id: 2,
        name: "宮益坂・明治通り・桜ヶ丘"
      },

      {
        id: 3,
        name: "青山・表参道・原宿"
      },

      {
        id: 4,
        name: "恵比寿・広尾"
      },

      {
        id: 5,
        name: "六本木・麻布・赤坂"
      },

      {
        id: 6,
        name: "代官山・中目黒"
      },

      {
        id: 7,
        name: "自由が丘・武蔵小杉"
      },

      {
        id: 8,
        name: "新宿・高田馬場・代々木"
      },

      {
        id: 9,
        name: "池袋・目白"
      },

      {
        id: 10,
        name: "銀座・有楽町"
      },

      {
        id: 11,
        name: "上野・神田"
      },

      {
        id: 12,
        name: "吉祥寺・荻窪・国分寺・立川"
      },

      {
        id: 13,
        name: "阿佐ヶ谷・高円寺・中野"
      }
    ]
  )

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
        price: "4000",
        prefecture_id: 13,
        area_id: 1,
        city: "渋谷区",
        street: "渋谷1丁目11-3",
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
        price: "5000",
        prefecture_id: 13,
        city: "立川市",
        street: "柴崎町2丁目",
        area_id: 12,
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
        price: "3000",
        prefecture_id: 13,
        city: "武蔵野市",
        street: "吉祥寺南町1丁目",
        area_id: 12,
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
        price: "1500",
        prefecture_id: 13,
        city: "渋谷区",
        street: "代官山町",
        area_id: 6,
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
        price: "2000",
        prefecture_id: 13,
        city: "渋谷区",
        street: "神宮前5丁目",
        area_id: 3,
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
        body: "こんにちは！今日は寒いですね〜！こんな日はおうち美容日和！いろいろとご提案させていただきますので、ぜひはなしてみるからどうぞ！",
        tag_list: "挨拶"
      },

      {
        user_id: 2,
        body: "サロンモデルさん募集中です！気になる方ははなしてみるでお声がけください！",
        tag_list: "募集"

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

  HairStyle.create!(
    [
      {
        name: "クール"
      },

      {
        name: "フェミニン"
      },

      {
        name: "エレガント"
      },

      {
        name: "ナチュラル"
      },

      {
        name: "ガーリー"
      },

      {
        name: "カジュアル"
      },

      {
        name: "外国人風"
      },

      {
        name: "モテ・愛され"
      },

      {
        name: "マニッシュ"
      },

      {
        name: "韓国風"
      },

      {
        name: "モード"
      },

      {
        name: "ビジネス・オフィス"
      }
    ]
  )

  CommunicationStyle.create!(
    [
      {
        name: "楽しくおしゃべりしたい"
      },

      {
        name: "静かにしていたい"
      },

      {
        name: "雑誌を読みたい"
      },

      {
        name: "漫画を読みたい"
      },

      {
        name: "テレビ・映画などを見たい"
      },

      {
        name: "携帯をいじっていたい"
      },

      {
        name: "お菓子やお茶を食べたい"
      },

      {
        name: "寝たい"
      },

      {
        name: "早めに帰りたい"
      },

      {
        name: "ゆっくりしたい"
      }
    ]
  )

3.times do |i|
  UserHairStyle.create!(user_id: 1, hair_style_id: HairStyle.find(i+1).id)
  UserHairStyle.create!(user_id: 2, hair_style_id: HairStyle.find((i+1)*3).id)
  UserHairStyle.create!(user_id: 6, hair_style_id: HairStyle.find(i+3).id)
  UserHairStyle.create!(user_id: 7, hair_style_id: HairStyle.find(i+4).id)
  UserHairStyle.create!(user_id: 8, hair_style_id: HairStyle.find(i+7).id)
end

3.times do |i|
  UserCommunicationStyle.create!(user_id: 3, communication_style_id: CommunicationStyle.find(i+1).id)
  UserCommunicationStyle.create!(user_id: 4, communication_style_id: CommunicationStyle.find((i+2)*2).id)
  UserCommunicationStyle.create!(user_id: 5, communication_style_id: CommunicationStyle.find((i+1)*2).id)
  UserCommunicationStyle.create!(user_id: 9, communication_style_id: CommunicationStyle.find(i+4).id)
  UserCommunicationStyle.create!(user_id: 10, communication_style_id: CommunicationStyle.find(i+7).id)
end