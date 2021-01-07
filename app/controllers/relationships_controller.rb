class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    @hairdressers = User.where(is_hairdresser: true)
    @hd_tweets = Tweet.where(user_id: @hairdressers).order(created_at: :desc)
    @users = User.where(is_hairdresser: false)
    @user_tweets = Tweet.where(user_id: @users).order(created_at: :desc)
    @user = User.find(params[:user_id])
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
