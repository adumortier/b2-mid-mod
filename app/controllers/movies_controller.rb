class MoviesController < ApplicationController

  def show
    # @page_info = {movie: movie,  list_actors: movie.list_actors, average_age: movie.average_age }
    @movie = Movie.find(params[:id])
  end


  private 

  def movie_params
    params.permit(:name, :creation_year, :genre)
  end
end