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
  
  def like(user)
    likes.create(user_id: user.id)
  end
  
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  def liked?(user) #いいね済みか調べる(true / false)
    like_users.include?(user)
  end
  
end
