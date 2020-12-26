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
        @review = Review.new(review_params)
        if @review.save
            redirect_to video_path(@review.video)
        else
            render :new
        end
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to video_reviews_path(@review.video)
        else
            render :edit
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :user_id, :video_id, :description)
    end

end