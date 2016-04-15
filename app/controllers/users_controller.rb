class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success! Your account has been created."
      session[:user_id] = @user.id
      redirect_to gifs_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
