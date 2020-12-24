class Admin::StatsController < ApplicationController
    before_action :authentication_required, :authorize_admin

    def index
        @users_count = User.count
        @genres_count = Genre.count
        @videos_count = Video.count
    end

end