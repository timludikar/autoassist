class UserMailer < ActionMailer::Base
  default :from => "welcome@autoassistant.ca"
    
    def welcome_email(user)
        @user = user
        @url = "http://localhost:3000/signin"
        mail(:to => user.email, :subject => "Welcome to AutoAssistant.ca")
    end
    
    
end
