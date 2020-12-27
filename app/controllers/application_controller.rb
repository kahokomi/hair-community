class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
  @search = User.ransack(params[:q])
  @search_users = @search.result(distinct: true)
  end

  def after_sign_in_path_for(resource)
    tweets_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :is_hairdresser])
  end
end
