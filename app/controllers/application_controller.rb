class ApplicationController < ActionController::Base

    def home
    end

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        #session[:user_id] it doesn''t work. user who logged in can see the other users pages!
        !!current_user
        # session[:user_id] && session[:user_id] == params[:id].to_i ? true : false
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    private

    def login(user)
        session[:user_id] = user.id
    end

#     def require_admin
#         if !current_user.admin?
#               redirect_to benefits_path
#         end
#    end
    
end
