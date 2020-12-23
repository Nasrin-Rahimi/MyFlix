class ApplicationController < ActionController::Base

    include SessionsHelper

    def home
    end

    private

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def admin_authentication_required
        # authentication_required
        if !logged_in?
            redirect_to login_path
        elsif !is_admin?
            redirect_to root_url, notice: "You don't have access to that page!"
        end
    end
    
end
