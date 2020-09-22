class SessionsController < ApplicationController
  def new
    @user = User.new
  end

# log user in and redirect to welcome screen if valid credentials
# direct back to login page with message if invalid
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:alert] = "invalid login credentials"
      render "new"
    end
  end
end
