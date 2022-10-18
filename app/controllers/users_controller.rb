class UsersController < ApplicationController
  
  def index
    # if session[:login_uid] != nil
    #   @users = User.all
      
    # else
    #   render 'top/login.html.erb'
    # end
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(uid: params[:user][:uid])
    user.pass = BCrypt::Password.create(params[:user][:pass])
    if user.save
      redirect_to root_path
    else
      return HttpResponse("ユーザー登録に失敗しました")
    end
      
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
end
