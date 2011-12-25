class UserSessionsController < ApplicationController

    before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => :destroy
        
    def new
        @title = "Sign Up"
        @user_session = UserSession.new
    end
    
    def create
        @user_session = UserSession.new(params[:user_session])
        if @user_session.save
            flash[:notice] = "Login successful!"
            #redirect_to account_url(@current_user)
            redirect_back_or_default account_url(@current_user)
        else
            render :action => :new
        end
    end
        
    def destroy
        current_user_session.destroy
        flash[:notice] = "Logout successful!"
        #redirect_back_or_default new_user_session_url
        redirect_to root_path
    end
end
