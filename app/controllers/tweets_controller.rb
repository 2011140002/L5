class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
  end
  
  def create
    
  end
  
  def destroy
  end
  
  
  
end
