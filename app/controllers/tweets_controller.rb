class TweetsController < ApplicationController
  def index
    if current_user
      @tweets = Tweet.all
      
    else
      render 'top/login.html.erb'
    end
    
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    tweet = Tweet.new(message: params[:tweet][:message])
    user = User.find_by(uid: session[:login_uid])
    user.tweets << tweet
    tweet.user = user
    if tweet.save
      redirect_to tweets_index_url
    else
      return HttpResponse("ツイートの投稿に失敗しました")
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_index_url
  end
  
end
