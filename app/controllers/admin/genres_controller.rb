class Admin::GenresController < ApplicationController
  
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(params_genre)
    @genres = Genre.all
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
  end
  
  def update
  end
  
  
  private
  
  def params_genre
    params.require(:genre).permit(:name)
  end
  
end
