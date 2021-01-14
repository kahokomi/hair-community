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

  # 美容師の時のみバリデーションをかける
  def hairdresser_valid?
    is_hairdresser == true
  end

  attachment :image
  attachment :icon_image

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy

  # フォロー機能のアソシエーション
  has_many :active_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  # ゲストログイン
  def self.guest_hairdresser
    find_or_create_by!(username: 'Guesthairdresser1', email: 'hd_guest@example.com', is_hairdresser: true) do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
  end

  def self.guest_user
    find_or_create_by!(username: 'Guestuser1', email: 'user_guest@example.com', is_hairdresser: false) do |user|
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
end
