class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    def require_user_logged_in
        unless logged_in?
               redirect_to login_url
        end
    end
    
    def counts(user)
        @count_tasks= user.tasks.count
        @count_following = user.followings.count
        @coount_follower = user.follower.count
    end
end
