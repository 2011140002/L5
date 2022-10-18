class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
    if @user.save
      render "users/index"
    else
      render "error"
    end
      
  end
  
  def destroy
  
  end
end
