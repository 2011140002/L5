class TopController < ApplicationController
  def main
    if session[:login_uid] != nil 
      render top_main
    else
      render top_login
    end
  end
  
  def login
    uid = params[:uid]
    pass = params[:pass]
    user = User.find_by(uid: uid)
    if user == nil
      session[:login_uid] = nil
      return HttpResponse("ログインに失敗しました")
    else
      if BCrypt::Password.new(user.pass) == pass
        session[:login_uid] = uid
        redirect_to root_path
      else
        p user
        session[:login_uid] = nil
        return HttpResponse("ログインに失敗しました")
      end
      
    end
  end
  
  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
end
