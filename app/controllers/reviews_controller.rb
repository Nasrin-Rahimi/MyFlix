class ReviewsController < ApplicationController

    def index
    end

    def show
    end

    def new
        @review = Review.new(video_id: params[:video_id], user_id: current_user.id)
    end

    def create
    end

end