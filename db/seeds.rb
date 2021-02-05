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
        body: "そういえば先日漫画を読みました！\n今流行りの鬼滅の刃です^^おもしろいですね〜",
        tag_list: "漫画,アニメ,鬼滅"
      },

      {
        user_id: 7,
        body: "今日はお昼にうどんをたべました！すごくおいしかったです^^",
        tag_list: "昼食,おすすめ"
      },

      {
        user_id: 2,
        body: "サロンモデルさん募集中です！気になる方ははなしてみるでお声がけください！",
        tag_list: "募集,サロンモデル,サロモ"
      },

      {
        user_id: 1,
        body: "こんにちは！今日は寒いですね〜！\nこんな日はおうち美容日和！\nいろいろとご提案させていただきますので、ぜひはなしてみるからどうぞ！",
        tag_list: "挨拶,提案"
      },

      {
        user_id: 6,
        body: "最近撮影に力をいれています！",
        tag_list: "撮影,サロモ"
      },

      {
        user_id: 3,
        body: "今日は新作が入荷して忙しい一日でした...髪切りたいな〜",
        tag_list: "新作入荷,アパレル,ファッション"
      },

      {
        user_id: 9,
        body: "先日ヘアスタイルを変えたら評判がよかったです。うれしいな",
        tag_list: "ヘアスタイル,イメチェン,美容"
      },

      {
        user_id: 3,
        body: "今日のご飯はカレーにします！",
        tag_list: "夕食,カレー"
      },

      {
        user_id: 2,
        body: "最近謎解きにはまってるんですよねー、松丸くんの謎解きが面白い！\n謎解きお好きな方おすすめの本とか教えてください！",
        tag_list: "謎解き"
      },

      {
        user_id: 4,
        body: "ヘアスタイルを変えたいけれど最近時間が取れないなあ\n夜遅くまでやっている美容師さんぜひ声かけてください！",
        tag_list: "イメチェン"
      },

      {
        user_id: 5,
        body: "今日も働いた〜！なにかリフレッシュしたいなあ！",
        tag_list: "リフレッシュ"
      },

      {
        user_id: 9,
        body: "そういえば昨日Uberで韓国料理食べました\nすごくおいしかったです！",
        tag_list: "韓国,昼食"
      },

      {
        user_id: 10,
        body: "最近新事業関連の動きでバタバタしてる。忙しいけど楽しいな",
        tag_list: "新事業,立ち上げ"
      },

      {
        user_id: 5,
        body: "いつも通勤前にカフェラテを飲んでいます。セブンのが一押し！",
        tag_list: "日課,ルーティーン,カフェラテ"
      },

      {
        user_id: 3,
        body: "明日は休日なので楽しみです！",
        tag_list: "休日,わくわく"
      },

      {
        user_id: 6,
        body: "カットモデルさん募集中です！",
        tag_list: "撮影,サロモ,カットモデル"
      },

      {
        user_id: 8,
        body: "カットのテストに合格しました！！応援してくださったみなさんありがとうございました！",
        tag_list: "テスト合格,カット"
      },

      {
        user_id: 7,
        body: "モデルさん募集しています！ご興味のある方ははなしかけるからお気軽にどうぞ！",
        tag_list: "サロモ,募集,サロンモデル"
      },

      {
        user_id: 2,
        body: "今日はたくさんご予約いただけてうれしかったです！",
      },

      {
        user_id: 10,
        body: "新事業の立ち上げに伴い、心機一転髪型を変えたいなと思っています。お声がけお待ちしています！",
        tag_list: "新事業,立ち上げ,募集,カットモデル"
      },

      {
        user_id: 4,
        body: "今日は寒かったですね〜、風邪ひかないようにしなきゃ！",
        tag_list: "天気,寒い,日常"
      },

      {
        user_id: 8,
        body: "カラーモデルさん募集しています！1500円でワンカラーさせていただけますよ！お気軽にどうぞ！",
        tag_list: "カラーモデル"
      },

      {
        user_id: 9,
        body: "韓国のアイドルかわいいよなあ〜",
        tag_list: "韓国"
      },

      {
        user_id: 1,
        body: "最近出かけられないので勉強するようにしています！",
        tag_list: "勉強,おこもり"
      },

      {
        user_id: 10,
        body: "最近お笑いが面白くてよく息抜きにしてる！千鳥おもしろい",
        tag_list: "お笑い"
      }
    ]
  )

  HairStyle.create!(
    [
      {
        id: 1,
        name: "クール"
      },

      {
        id: 2,
        name: "レディ"
      },

      {
        id: 3,
        name: "エレガント"
      },

      {
        id: 4,
        name: "ナチュラル"
      },

      {
        id: 5,
        name: "キュート"
      },

      {
        id: 6,
        name: "カジュアル"
      },

      {
        id: 7,
        name: "外国人風"
      },

      {
        id: 8,
        name: "モテ・愛され"
      },

      {
        id: 9,
        name: "マニッシュ"
      },

      {
        id: 10,
        name: "韓国風"
      },

      {
        id: 11,
        name: "モード"
      },

      {
        id: 12,
        name: "ビジネス・オフィス"
      }
    ]
  )

  CommunicationStyle.create!(
    [
      {
        id: 1,
        name: "楽しくおしゃべり"
      },

      {
        id: 2,
        name: "会話は控えめ"
      },

      {
        id: 3,
        name: "読書(雑誌)"
      },

      {
        id: 4,
        name: "読書(漫画)"
      },

      {
        id: 5,
        name: "テレビ・映画視聴"
      },

      {
        id: 6,
        name: "携帯閲覧"
      },

      {
        id: 7,
        name: "お菓子やお茶の飲食"
      },

      {
        id: 8,
        name: "仮眠"
      },

      {
        id: 9,
        name: "早め帰宅"
      },

      {
        id: 10,
        name: "ゆったり"
      }
    ]
  )

3.times do |i|
  UserHairStyle.create!(user_id: 1, hair_style_id: HairStyle.find(i+1).id)
  UserHairStyle.create!(user_id: 2, hair_style_id: HairStyle.find((i+1)*3).id)
  UserHairStyle.create!(user_id: 3, hair_style_id: HairStyle.find(i+1).id)
  UserHairStyle.create!(user_id: 4, hair_style_id: HairStyle.find(i+8).id)
  UserHairStyle.create!(user_id: 5, hair_style_id: HairStyle.find(i+8).id)
  UserHairStyle.create!(user_id: 6, hair_style_id: HairStyle.find(i+3).id)
  UserHairStyle.create!(user_id: 7, hair_style_id: HairStyle.find(i+4).id)
  UserHairStyle.create!(user_id: 8, hair_style_id: HairStyle.find(i+7).id)
  UserHairStyle.create!(user_id: 9, hair_style_id: HairStyle.find(i+7).id)
  UserHairStyle.create!(user_id: 10, hair_style_id: HairStyle.find(i+8).id)
end

3.times do |i|
  UserCommunicationStyle.create!(user_id: 1, communication_style_id: CommunicationStyle.find(i+3).id)
  UserCommunicationStyle.create!(user_id: 2, communication_style_id: CommunicationStyle.find(i+2).id)
  UserCommunicationStyle.create!(user_id: 3, communication_style_id: CommunicationStyle.find(i+1).id)
  UserCommunicationStyle.create!(user_id: 4, communication_style_id: CommunicationStyle.find((i+2)*2).id)
  UserCommunicationStyle.create!(user_id: 5, communication_style_id: CommunicationStyle.find((i+1)*2).id)
  UserCommunicationStyle.create!(user_id: 6, communication_style_id: CommunicationStyle.find(i+4).id)
  UserCommunicationStyle.create!(user_id: 7, communication_style_id: CommunicationStyle.find(i+5).id)
  UserCommunicationStyle.create!(user_id: 8, communication_style_id: CommunicationStyle.find(i+6).id)
  UserCommunicationStyle.create!(user_id: 9, communication_style_id: CommunicationStyle.find(i+4).id)
  UserCommunicationStyle.create!(user_id: 10, communication_style_id: CommunicationStyle.find(i+7).id)
end