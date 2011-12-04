class UsersController < ApplicationController
    
    def show
        @user = Users.find(params[:id])
        #@title = "#{@user.name}"
    end

end
