class ReviewsController < ApplicationController
    before_action :authentication_required
    
    def index
        @reviews = Review.by_video(params[:video_id])
        # OR
        # @video = Video.find(params[:video_id])
        # @reviews = @video.reviews
    end

    def show
    end

    def new
        @review = Review.new(video_id: params[:video_id], user_id: current_user.id)
    end

    def create
        #try to use strong parameters
        @review = Review.new(video_id: params[:video_id], user_id: current_user.id, rating: params[:review][:rating], description: params[:review][:description])
        if @review.save
            redirect_to video_path(@review.video)
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :user_id, :video_id, :description)
    end

end