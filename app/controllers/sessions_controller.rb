class SessionsController < ApplicationController
    def omniauth
        # binding.pry
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid] , provider: request.env['omniauth.auth'][:provider]) do |u|
            u.username = request.env['omniauth.auth'][:info][:last_name]
            u.email = request.env['omniauth.auth'][:info][:email]
            u.password_digest = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            flash[:success] = 'login được'
            redirect_to root_path
            else
            flash[:danger] = 'không login được'
            redirect_to root_path
        end
    end
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
end
