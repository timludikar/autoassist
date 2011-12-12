class UsersController < ApplicationController
    
    def show
        @user = Users.find(params[:id])
        @title = "#{@user.first} #{@user.last}"
    end

end
