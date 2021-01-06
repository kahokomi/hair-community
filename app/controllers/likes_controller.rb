class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    like.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy
  end
end
