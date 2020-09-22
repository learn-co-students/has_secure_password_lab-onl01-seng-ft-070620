class UsersController < ApplicationController
  def new
    @user = User.new
  end

# sign up the user and log them in, given valid credentials
# otherwise, redirect to sign up form
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
