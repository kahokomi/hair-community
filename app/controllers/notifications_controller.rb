class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notification
    @notifications.where(checked: false).includes([:visitor, :visited, :tweet]).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_user.passive_notification.destroy_all
    redirect_to notifications_path
  end
end
