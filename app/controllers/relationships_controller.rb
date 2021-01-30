class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    @user.create_notification_follow(current_user)

    @hairdressers = User.where(is_hairdresser: true)
    @hd_tweets = Tweet.where(user_id: @hairdressers).order(created_at: :desc)
    @users = User.where(is_hairdresser: false)
    @user_tweets = Tweet.where(user_id: @users).order(created_at: :desc)
    @my_tweets = Tweet.where(user_id: @user).order(created_at: :desc)

  end

  def destroy
    current_user.unfollow(params[:user_id])
    @hairdressers = User.where(is_hairdresser: true)
    @hd_tweets = Tweet.where(user_id: @hairdressers).order(created_at: :desc)
    @users = User.where(is_hairdresser: false)
    @user_tweets = Tweet.where(user_id: @users).order(created_at: :desc)
    @user = User.find(params[:user_id])

  end

  def follows
    user = User.find(params[:user_id])
    @following_hds = user.followings.where(is_hairdresser: true)
    @following_users = user.followings.where(is_hairdresser: false)
    @follower_hds = user.followers.where(is_hairdresser: true)
    @follower_users = user.followers.where(is_hairdresser: false)
  end
end
