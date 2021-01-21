class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    # ツイートの一覧表示・新規投稿
    @tweet = Tweet.new
    @hairdressers = User.where(is_hairdresser: true)
    @hd_tweets = Tweet.where(user_id: @hairdressers).order(created_at: :desc).includes([:taggings])
    @users = User.where(is_hairdresser: false)
    @user_tweets = Tweet.where(user_id: @users).order(created_at: :desc).includes([:taggings])
    
    # タグで絞り込み
    if params[:tag_name]
      @hd_tweets = @hd_tweets.tagged_with(params[:tag_name])
      @user_tweets = @user_tweets.tagged_with(params[:tag_name])
    end
    @tag = params[:tag_name]

    #サイドバーで新規ユーザを表示
    @new_user = User.where(is_hairdresser: false).order(created_at: :desc)
    @new_hairdresser = User.where(is_hairdresser: true).order(created_at: :desc)
  end

  def create
    @hairdressers = User.where(is_hairdresser: true)
    @hd_tweets = Tweet.where(user_id: @hairdressers).order(created_at: :desc)
    @users = User.where(is_hairdresser: false)
    @user_tweets = Tweet.where(user_id: @users).order(created_at: :desc)
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    unless @tweet.save
      render 'error'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :image, :body, :tag_list)
  end
end
