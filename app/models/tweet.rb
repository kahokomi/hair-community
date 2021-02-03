class Tweet < ApplicationRecord
  acts_as_taggable

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :body, presence: true

  attachment :image

  # いいね通知のメソッド
  def create_notification_like(current_user)
    # いいねされたことがあるかどうかの検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_user.id, user_id, id, 'like'])

    if temp.blank?
      notification = current_user.active_notification.new(
        tweet_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
