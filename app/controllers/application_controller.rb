class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user
    helper_method :current_user

    def logged_in?
       !!current_user
    end

    private

    def require_log_in
      redirect_to root_path unless logged_in?
    end

    def is_admin
      if session[:authority] === 1 || session[:authority] === 6
        return true
      else
        return false
      end
    end

    def is_ops
      if session[:authority] === 2 || session[:authority] === 3 || session[:authority] === 1
        return true
      else
        return false
      end
    end


    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end