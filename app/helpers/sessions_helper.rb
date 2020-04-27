module SessionsHelper
    def current_user
        if @current_user.nil?
           @current_user = User.find_by(id: session[:user_id])
        else
           @current_user
        end
    end
    def logged_in?
        if current_user
            return true
        else
            return false
        end
    end
end
