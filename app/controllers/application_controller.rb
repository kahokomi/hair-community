class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if params[:q].present?
      params[:q][:username_or_name_cont_any] = params[:q][:username_or_name_cont_any].split(/[[:blank:]]+/)
      @q = User.ransack(params[:q])
      @users = @q.result

    else
      @q = User.ransack(params[:q])
      @users = @q.result
    end
  end

  def after_sign_in_path_for(resource)
    tweets_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :is_hairdresser])
  end
end
