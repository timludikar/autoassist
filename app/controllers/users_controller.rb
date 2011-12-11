class UsersController < ApplicationController
    
    def show
        @user = Users.find(params[:id])
        @title = "#{@user.first} #{@user.last}"
    end
    
    def new
        @title = "Sign up"
        #@user = Users.new
    end
    
    def create
        @user = Users.new(params[:user])
        if @user.save
            redirect_to @user
            else
            @title = "Sign up"
            render 'new'
        end
    end
end
