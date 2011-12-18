class SessionsController < ApplicationController
    def new
        @title = "Sign in"
    end

    def create
        user = User.authenicate(params[:session][:email], params[:session][:password])
        
        if user.nil?
            @title = "Sign in"
            flash.now[:error] = "Invalid email/password combination"
            redirect_to login_path
        else
            user_login(user)
            redirect_to user
        end        
    end
    
    def destroy
        user_logout
        redirect_to root_path
    end
    
end
