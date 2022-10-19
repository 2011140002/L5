class TopController < ApplicationController
  def main
    if current_user != nil 
      redirect_to tweets_index_url
    else
      render 'login.html.erb'
    end
  end
  
  def login
    uid = params[:uid]
    pass = params[:pass]
    user = User.find_by(uid: uid)
    if user == nil
      session[:login_uid] = nil
      return 'ログインに失敗しました'
    else
      if BCrypt::Password.new(user.pass) == pass
        session[:login_uid] = uid
        redirect_to tweets_index_url
      else
        p user
        session[:login_uid] = nil
        return 'ログインに失敗しました'
      end
      
    end
  end
  
  def logout
    session[:login_uid] = nil
    redirect_to top_main_url
  end
  
end
