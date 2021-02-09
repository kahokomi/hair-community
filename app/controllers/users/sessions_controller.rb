# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new_hairdresser_guest
    hairdresser = User.guest_hairdresser
    sign_in hairdresser
    redirect_to about_path, notice: 'ゲストユーザー(美容師)としてログインしました。'
  end

  def new_user_guest
    user = User.guest_user
    sign_in user
    redirect_to about_path, notice: 'ゲストユーザー(一般ユーザ)としてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
