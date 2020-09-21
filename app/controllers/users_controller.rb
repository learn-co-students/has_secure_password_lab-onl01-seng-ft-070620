class UsersController < ApplicationController

    def home
        @user = User.find_by(id: session[:user_id])
        redirect_to new_user_path if !current_user
    end
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            redirect_to new_user_path, alert: "Please enter valid login credentials."
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
