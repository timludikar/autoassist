class ApplicationController < ActionController::Base
        protect_from_forgery
    
        def home
            @title = "Home"
        end
end
