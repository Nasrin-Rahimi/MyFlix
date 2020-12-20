class VideosController < ApplicationController

    def index
        @videos = Video.all
    end 

    def show
        @video = Video.find(params[:id])
    end

    def new
        @video = Video.new
        2.times { @video.genres.build }
    end
    
    def create
        # raise params.inspect
        @video = Video.new(video_params)
        if @video.save
            redirect_to video_path(@video)
        else
            render :new
        end
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
        params.require(:video).permit(:title, :description, :video_url, :image_url, genre_ids: [], genres_attributes: [:title])
    end

end