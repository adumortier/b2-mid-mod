class ActorMoviesController < ApplicationController

  def create
    actor = Actor.find_by name: params[:name]
    ActorMovie.create({movie_id: params[:movie_id], actor_id: actor.id })
    redirect_to "/movies/#{params[:movie_id]}"
  end

end