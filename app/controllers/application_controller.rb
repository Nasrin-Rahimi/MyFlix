class ApplicationController < ActionController::Base

    include SessionsHelper, ApplicationHelper

    def home
        @users_count = User.count
        @genres_count = Genre.count
        @videos_count = Video.count
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
