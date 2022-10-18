class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    if User.find_by(uid: params[:user][:uid])
      flash[:notice] = 'そのユーザーIDはすでに使われています'
      redirect_to users_new_url
    else
      user = User.new(uid: params[:user][:uid])
      user.pass = BCrypt::Password.create(params[:user][:pass])
    
      if user.save
        redirect_to root_path
      else
        redirect_to users_new_url
      end
    end
      
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
end
