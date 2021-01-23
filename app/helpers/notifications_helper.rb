module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:tweets_path(notification.tweet_id), style:"font-weight: bold;")+"にいいねしました"
    end
  end
end
