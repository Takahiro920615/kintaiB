module SessionsHelper
end

    def log_in(user)
      session[:user_id] = user.id
    end
      
    def current_user
      if session[:user_id]
        if @current_user ||= User.find_by(id: session[:user_id])
        else
          @current_user
        end
      end
    end
      
    def logged_in?
      !current_user.nil?
    end
  
