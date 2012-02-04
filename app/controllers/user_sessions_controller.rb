class UserSessionsController < ApplicationController
    before_filter :authenticate_user!, :only => :destroy
end
