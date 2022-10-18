class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    if @tweet.save
      render 'tweets/index'
    else
      return HttpResponse("ツイートの投稿に失敗しました")
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to 'tweets/index'
  end
  
  
  
end
