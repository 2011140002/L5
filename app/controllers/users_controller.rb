class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    pass = BCrypt::Password.create(params[:user][:pass])
    @user = User.new(uid: params[:user][:uid], pass: pass)
    if @user.save
      redirect_to "/"
    else
      render "error"
    end
      
  end
  
  def destroy
    user = User.find(params[:user][:id])
    user.destroy
  
  end
end
