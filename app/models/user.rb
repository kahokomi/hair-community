class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  attachment :icon_image
  
  has_many :tweets
  has_many :favorites
  has_many :blogs
  has_many :user_rooms
  has_many :chats
  
end
