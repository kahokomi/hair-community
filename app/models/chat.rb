class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
  validates :content, presence: true

  # チャット通知のメソッド
  def create_notification_chat(current_user, room_id)
    other_users = UserRoom.where(room_id: room_id).where.not(user_id: current_user)
    @one_of_other = other_users.find_by(room_id: room_id)
    notification = current_user.active_notification.new(
      room_id: room_id,
      chat_id: id,
      visited_id: @one_of_other.user_id,
      action: 'dm'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
