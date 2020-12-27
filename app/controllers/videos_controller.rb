class VideosController < ApplicationController

    before_action :authentication_required
    before_action :authorize_admin, except: [:index, :show]
    before_action :set_video, only: [:show, :edit, :update]
    
    def index
        @videos = Video.search(params[:genre])
        if @videos.empty?
            flash.now[:notice] = "There is no video for selected genre!"
        end
    end 

    def show
    end

    def new
        @video = Video.new
        build_new_genres
    end
    
    def create
        @video = Video.new(video_params)
        if @video.save
            redirect_to video_path(@video)
        else
            build_new_genres
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
        params[:video][:image_url] = "videos/" + params[:video][:image_url].original_filename if params[:video][:image_url]
        params.require(:video).permit(:title, :description, :video_url, :image_url, :released_year, genre_ids: [], genres_attributes: [:title])
    end

    def set_video
        @video = Video.find(params[:id])
    end

    def build_new_genres
        2.times { @video.genres.build }
    end

end