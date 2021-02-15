# へあこみゅ

![hair-community-logo](https://user-images.githubusercontent.com/71372573/107901326-b4875180-6f86-11eb-9df0-dbd3e81c5c44.png)


## サイト概要

顧客獲得を目指す美容師さんと、美容師選びに悩む顧客をつなげるコミュニティサイトです。

## URL

http://hair-community.work/

【ゲストログイン】より入力不要でログインが可能です。  
また、ユーザは【美容師】【一般ユーザ】の二種類です。

#### 美容師と一般ユーザでの大まかな違い
- レイアウト(一部)
- マイページ記載内容
- 通知機能のような2つのアカウントによって動作する機能

よければそれぞれのゲストログインを使用してお気軽にご覧ください。  
**[注意]　別のアカウントに切り替える前に、ログアウトをお願いいたします。**


## 制作の背景

### 美容師目線
私は前職で、美容業界の代理店営業として、顧客である美容師さんのお悩みを多く伺ってきました。  
中でも
**「新規顧客の獲得が難しい」「リピートしてくれるお客様が少ない」**  
というお悩みはほぼ全ての美容室で挙がる課題といっても過言ではありませんでした。

一方、人気が絶えない美容師の方は、
- インスタグラムのフォロワー数が多い
- メディア露出している  

など、みな知名度が非常に高いことが特徴です。  

そこで、当サイトのようなエンドユーザとのコミュニケーションツールにより、  
美容師さんが広く認知され、課題解決のきっかけになればと考えています。

### エンドユーザ目線
私が美容室、美容師の方を選ぶ際、SNSからスタイル写真を見て決めることが多いのですが、   
実際に行ってみると**お店の雰囲気や美容師の方との相性が私とは少し合わないな**、と感じることがしばしばありました。  

また、友人からも   
**「話すのが苦手だから、美容師さんがあまり話しかけてこないところ知らない？」「この前行った美容室で、自分の要望がうまく伝えられなかったの...」**  
といった悩みを聞くこともありました。    
そういった方達が当サイトを通じて美容師さんと直接コミュニケーションを取ることで、  
自分に合った美容師さんを見つけ、生涯顧客になれるようなきっかけづくりを実現したいです。

### ターゲットユーザ
- 顧客獲得に悩む美容師の方
- 美容師選びに悩むエンドユーザの方

### 主な利用シーン

#### 美容師
- アシスタントの方、若手スタイリストの方のモデルハント
- 一般スタイリストの方の新規顧客獲得

#### エンドユーザ
- 髪を切るための美容師選び
- プロ目線での美容の知識を取り入れたい時

## 設計書

### 機能一覧
- 通知機能
  - フォロー・いいね・DMが来た時に通知
- 検索機能
  - キーワード検索の他、ヘアスタイルやコミュニケーションスタイルも選択可能
- タグ機能(acts-as-taggable-on)
  - つぶやきの際追加可能
- マップ表示
  - 美容師側マイページの住所を使用し表示
- DM機能
- いいね機能
- フォロー機能

詳細な機能一覧はこちら
https://docs.google.com/spreadsheets/d/1z2ZpQg3YC6JsmXkjLbuz_eYbRtVUfsT8RfFLmWhzp3Y/edit#gid=0

## 開発環境

### フロントエンド
- Bootstrap 4.3.1
- JavaScript、jQuery、Ajax

### バックエンド
- Ruby 2.6.3
- Rails 5.2.4.4

### 開発環境
- Linux(CentOS)

### 本番環境
- AWS (EC2、RDS for MySQL、Route53)
- MySQL2
- Nginx、 Puma
- GitHub Actions

### テスト
- Rspec (単体／結合） 計100以上

### その他使用技術、工夫した点
- N+1問題の解消(bullet)
- リーダブルコード(Rubocop-airbnb、部分テンプレート等)
- 非同期通信 (フォロー、いいね、投稿・削除ボタン、DM)
- 外部API(Google Maps API)
- チーム開発を意識したGitHubの活用 （プルリク、マージ）
- 新着ユーザのスライダー表示(bxslider-rails)
- ActiveHush(都道府県、東京のエリアデータ)

### ER図
![ER図](https://user-images.githubusercontent.com/71372573/107910772-64b48480-6f9e-11eb-90f8-c6218c69d10a.png)


## 使用素材
silhouetteillust様  
https://www.silhouette-illust.com/

イラストAC様  
https://www.ac-illust.com/

fontfree様  
https://fontfree.me/

unsplash様  
https://unsplash.com/
