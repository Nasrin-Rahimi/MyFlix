class VideosController < ApplicationController

    before_action :authentication_required
    before_action :authorize_admin, except: [:index, :show]
    before_action :set_video, only: [:show, :edit, :update]
    
    def index
        @videos = Video.all
    end 

    def show
    end

    def new
        @video = Video.new
        2.times { @video.genres.build }
    end
    
    def create
        @video = Video.new(video_params)
        if @video.save
            redirect_to video_path(@video)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @video.update(video_params)
            redirect_to @video
        else
            render :edit
        end
    end

    def destroy
        @video = Video.find(params[:id])
        @video.destroy
        redirect_to videos_path
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :video_url, :image_url, :released_year, genre_ids: [], genres_attributes: [:title])
    end

    def set_video
        @video = Video.find(params[:id])
    end

end