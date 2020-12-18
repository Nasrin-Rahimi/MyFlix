class VideosController < ApplicationController
    
    def create
        @genre = Genre.find(params[:genre_id])
        @video = @genre.videos.create(video_params)
        redirect_to genre_path(@genre)
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :video_url, :image_url)
    end

end
