class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :name,
      :sex,
      :age,
      :year,
      :hair_salon,
      :prefecture,
      :city,
      :street,
      :job,
      :introduction,
      :image,
      :position,
      :icon_image,
      { :hair_style_ids=> [] },
      { :communication_style_ids=> [] }
  )
  end
end
