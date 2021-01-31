class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if params[:q].present?
      params[:q][:username_or_name_or_hair_salon_or_job_or_position_or_city_or_street_or_introduction_cont_any] = params[:q][:username_or_name_or_hair_salon_or_job_or_position_or_city_or_street_or_introduction_cont_any].split(/[[:blank:]]+/)
      @q = User.ransack(params[:q])
      @users = @q.result
      # ログインユーザが一般ユーザーの際、カテゴリ検索をかけた時の結果を美容師のみに限定
      if current_user.is_hairdresser == false
        if params[:q][:hair_styles_id_in] == [""] && params[:q][:communication_styles_id_in] == [""]
          @hds = @q.result
        else
          @hds = @q.result.where(is_hairdresser: true)
        end
      end
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
