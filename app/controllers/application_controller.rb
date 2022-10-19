class ApplicationController < ActionController::Base
    def L5
      session[:c] ||= 0
      session[:c] = session[:c].to_i + 1
      render plain: session[:c]
    end
    
    private
    def current_user
      if session[:login_uid]
        User.find_by(uid: session[:login_uid])
      end
    end
    helper_method :current_user
end
