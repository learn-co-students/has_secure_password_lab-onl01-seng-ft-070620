class UsersController < ApplicationController
    def home
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to new_users_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end