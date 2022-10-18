class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    user.like_tweets << tweet
    tweet.like_tweets << user
    redirect_to tweets_index_url
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    tweet.likes.find_by(user_id: user.id).destroy
    redirect_to tweets_index_url
  end
end
