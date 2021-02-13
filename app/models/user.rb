class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数の指定
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/.freeze

  validates :username, uniqueness: true, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6, maximum: 20 }
  validates :name, presence: true, on: :update
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, on: :update, if: :hairdresser_valid?
  validates :position, presence: true, on: :update, if: :hairdresser_valid?
  validates :hair_salon, presence: true, on: :update, if: :hairdresser_valid?
  validates :job, presence: true, on: :update, unless: :hairdresser_valid?
  validates :age, allow_nil: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, on: :update
  validates :price, allow_nil: true, numericality: { greater_than_or_equal_to: 1 }, on: :update, if: :hairdresser_valid?
  validates :prefecture_id, presence: true, on: :update, if: :hairdresser_valid?
  validates :city, presence: true, on: :update, if: :hairdresser_valid?
  validates :street, presence: true, on: :update, if: :hairdresser_valid?

  # 美容師の時のみバリデーションをかける
  def hairdresser_valid?
    is_hairdresser == true
  end

  attachment :image
  attachment :icon_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, optional: true, presence: true
  belongs_to :area, optional: true, presence: true

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :user_rooms
  has_many :user_communication_styles, dependent: :destroy
  has_many :user_hair_styles, dependent: :destroy
  has_many :communication_styles, through: :user_communication_styles
  has_many :hair_styles, through: :user_hair_styles

  # フォロー機能のアソシエーション
  has_many :active_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  # 通知機能のアソシエーション
  has_many :active_notification, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notification, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # ゲストログイン
  def self.guest_hairdresser
    find_or_create_by!(
      username: "Guesthairdresser1",
      email: "hd_guest@example.com",
      name: "美容太郎",
      age: 25,
      year: 7,
      sex: "男性",
      hair_salon: "hairsalon OS",
      position: "スタイリスト",
      price: "4000",
      prefecture_id: 13,
      city: "渋谷区",
      street: "神南1丁目",
      is_hairdresser: true
    ) do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
  end

  def self.guest_user
    find_or_create_by!(
      username: "Guestuser1",
      email: "user_guest@example.com",
      name: "一般花子",
      age: 25,
      sex: "女性",
      job: "エンジニア",
      is_hairdresser: false,
    ) do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
  end

  # フォロー機能のメソッド
  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    active_relationships.create(follower_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(follower_id: user_id).destroy
  end

  # いいね機能のメソッド
  def already_liked?(tweet)
    likes.exists?(tweet_id: tweet.id)
  end

  # フォロー通知のメソッド
  def create_notification_follow(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notification.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # ジオコーダーで住所の変換を行う
  geocoded_by :concat_address
  after_validation :geocode

  # 都道府県、市町村、番地カラムの内容を結合
  def concat_address
    # binding.pry
    if prefecture
      "%s%s%s" % [prefecture.name, city, street]
    end
  end
end
