module UserSessionsHelper
    def signed_in?
        !current_user.nil?
    end
end
