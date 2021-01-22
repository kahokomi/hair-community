class Tweet < ApplicationRecord
  acts_as_taggable

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, presence: true

  attachment :image
end
