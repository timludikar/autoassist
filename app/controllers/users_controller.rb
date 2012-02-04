class UsersController < ApplicationController
    before_filter :authenticate_user!, :only => [:show, :edit, :update]
    
    def new
        @user = User.new
    end
    
    def show
        @user = current_user
        @title = "#{@user.first} #{@user.last}"
    end
    
    def edit
        @user = current_user
        @title = "#{@user.first} #{@user.last}"    
    end
    
    def update
        @user = current_user # makes our views "cleaner" and more consistent
        if @user.update_attributes(params[:user])
            flash[:notice] = "Account updated!"
            redirect_to profile_url
            else
            render :action => :edit
        end
    end
end