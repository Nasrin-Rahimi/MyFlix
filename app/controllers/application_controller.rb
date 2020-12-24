class ApplicationController < ActionController::Base

    include SessionsHelper, ApplicationHelper

    def home
    end

    private

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def authorize_admin
       redirect_to root_url, notice: "You don't have access to that page!" if !is_admin? 
    end

end
