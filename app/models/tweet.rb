class Tweet < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, presence: true

  attachment :image
end
