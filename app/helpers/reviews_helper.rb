module ReviewsHelper
    def user_video_exists?(video)
        Review.exists?(:user_id => current_user.id, :video_id => video.id)
    end

    def review_by_user_video(video)
        Review.where(:user_id => current_user.id, :video_id => video.id).first
    end

end
