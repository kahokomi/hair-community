class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @my_tweets = Tweet.includes([:tags, :user]).where(user_id: @user).order(created_at: :desc)

    # googlemapピン表示のため
    gon.lat = @user.latitude
    gon.lng = @user.longitude
    gon.concat_address = @user.concat_address
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
      :price,
      :prefecture_id,
      :city,
      :street,
      :area_id,
      :job,
      :introduction,
      :image,
      :position,
      :icon_image,
      { :hair_style_ids => [] },
      { :communication_style_ids => [] }
    )
  end
end
