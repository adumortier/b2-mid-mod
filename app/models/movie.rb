class Movie < ApplicationRecord 

  validates_presence_of :name
  validates_presence_of :creation_year
  validates_presence_of :genre

  belongs_to :studio

  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def list_actors 
    actors.order(:name)
  end

  def average_age 
    actors.average(:age)
  end

  def add_actor(actor_name)
    actor = Actor.where("name = '#{actor_name}'")
    actors << actor 
  end


end