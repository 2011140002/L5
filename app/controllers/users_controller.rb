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
      uid = params[:user][:uid]
      password = params[:user][:password]
      password_confirmation = params[:user][:password_confirmation]
      user = User.new(uid: uid, password: password,
      password_confirmation: password_confirmation)
      if user.save
        redirect_to root_path
      else
        flash[:notice] = 'パスワードが一致していません'
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
