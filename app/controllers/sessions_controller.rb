class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to new_user_path, alert: "Please enter correct login credentials."
        end
    end
end