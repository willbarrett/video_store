class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Welcome Back!'
      if session[:next_url].present?
        redirect_to session[:next_url]
      else
        redirect_to root_url
      end
    else
      flash.now.alert = "Invalid Email or Password"
      render action: 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'You have been logged out.'
  end
end
