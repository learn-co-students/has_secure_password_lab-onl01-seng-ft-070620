class WelcomeController < ApplicationController
    
    def homepage
        redirect_to controller: 'sessions', action: 'new' unless current_user
    end
end