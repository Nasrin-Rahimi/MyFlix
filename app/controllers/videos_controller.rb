class VideosController < ApplicationController

    def index
        @videos = Video.all
    end 

    def show
        @video = Video.find(params[:id])
    end

    def new
    end
    
    def create
        @genre = Genre.find(params[:genre_id])
        @video = @genre.videos.create(video_params)
        redirect_to genre_path(@genre)
    end

    def destroy
        # raise params.inspect
        # @genre = Genre.find(params[:genre_id])
        # @video = @genre.videos.find(params[:id])
        # @video.destroy
        # redirect_to genre_path(@genre)
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :video_url, :image_url)
    end

end