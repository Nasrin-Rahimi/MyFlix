class GenresController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    before_action :set_genre, only: [:show, :edit, :update]
    
    def index
        @genres = Genre.all
    end

    def show
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to @genre
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @genre.update(genre_params)
            redirect_to @genre
        else
            render :edit
        end
    end

    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy
        redirect_to genres_path
    end

    private

    def genre_params
        params.require(:genre).permit(:title)
    end

    def set_genre
        @genre = Genre.find(params[:id])
    end
    
end