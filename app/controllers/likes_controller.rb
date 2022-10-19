class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    unless liked?(current_user)
      tweet.like(current_user)
    end
    redirect_to tweets_index_url
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if liked?(current_user)
      tweet.unlike(current_user)
    end
    redirect_to tweets_index_url
  end
end
