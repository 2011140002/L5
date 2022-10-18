class UsersController < ApplicationController
  
  def index
    if session[:login_uid] != nil
      @users = User.all
      
    else
      render 'top/login.html.erb'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    if User.find_by(uid: params[:user][:uid])
      redirect_to 'users/new'
    end
    user = User.new(uid: params[:user][:uid])
    user.pass = BCrypt::Password.create(params[:user][:pass])
    
    if user.save
      redirect_to root_path
    else
      redirect_to 'users/new'
    end
      
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
end
