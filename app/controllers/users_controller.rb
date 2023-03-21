class UsersController < ApplicationController
  # before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    # Enable for normal top level User attributes
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    # Enable for hashed User attributes
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
