module SessionsHelper
    def current_user
        if (user_id = session[:user_id])
          @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
          # raise
          user = User.find_by(id: user_id)
          if user && user.authenticated?(:remember, cookies[:remember_token])
            log_in user
            @current_user = user
          end
        end
      end
    def logged_in?
        !current_user.nil?
    end
    def log_out
        # forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
end
