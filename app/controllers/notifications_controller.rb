class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notification
    @notifications.where(checked: false).includes([:visitor, :visited]).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_user.passive_notification.destroy_all
    redirect_to notifications_path
  end
end
