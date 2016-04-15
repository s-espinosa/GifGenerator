class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Welcome. You are successfully logged in."
      session[:user_id] = @user.id
      redirect_to gifs_path
    else
      flash[:error] = "Please try again."
      render 'sessions/new'
    end
  end

  def destroy
    flash[:logout] = "You have been logged out."
    session.clear
    redirect_to root_path
  end
end
