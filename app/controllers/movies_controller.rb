class MoviesController < ApplicationController

  def show
    movie = Movie.find(params[:id])
    @page_info = {movie: movie,  list_actors: movie.list_actors, average_age: movie.average_age }
  end
end