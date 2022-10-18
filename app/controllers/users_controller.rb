class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(uid: params[:uid], pass: params[:pass])
    if user.save
      render "/"
    else
      reder "error"
    end
      
  end
  
  def destroy
  
  end
end
