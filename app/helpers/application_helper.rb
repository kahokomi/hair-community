module ApplicationHelper
  def unchecked_notifications
    @notifications = current_user.passive_notification.where(checked: false)
  end
end
