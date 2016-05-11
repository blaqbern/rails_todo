class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_login

  protected
    def logged_in?
      session[:user_id]
    end

    def current_user
      @current_user ||= User.find session[:user_id]
    end

    def ensure_login
      redirect_to login_path unless logged_in?
    end

    helper_method :logged_in?, :current_user

end
