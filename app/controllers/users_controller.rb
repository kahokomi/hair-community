class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.where(id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def following
    #@user = User.find(params[:id])
  end

  def followers
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :name,
      :sex,
      :age,
      :year,
      :hair_salon,
      :job,
      :introduction,
      :image,
      :position,
      :icon_image)
  end

end