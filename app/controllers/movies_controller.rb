class MoviesController < ApplicationController

  def show
    movie = Movie.find(params[:id])
    @page_info = {movie: movie,  list_actors: movie.list_actors, average_age: movie.average_age }
  end

  def update
    movie = Movie.find(params[:id])
    movie.add_actor(params[:name])
    redirect_to "/movies/#{movie.id}"
  end

  private 

  def movie_params
    params.permit(:name, :creation_year, :genre)
  end
end