class SessionsController < ApplicationController
  skip_before_filter :ensure_login

  def new
    # new.html.erb
  end

  def create
    login = params[:user][:login]
    password = params[:user][:password]

    user = User.find_by_login login
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'You have been successfully logged in'
    else
      flash.now[:alert] = 'Incorrect username or password'
      render action: 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been successfully logged out'
  end
end
