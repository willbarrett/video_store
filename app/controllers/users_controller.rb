class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      if session[:next_url].present?
        redirect_to session[:next_url]
      else
        redirect_to root_url
      end
    else
      render action: 'new'
    end
  end
end
