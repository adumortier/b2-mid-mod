class Actor < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :age

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def has_worked_with 
    movies.joins(:actors).where("actors.id != #{self.id}").distinct.pluck("actors.name")
  end

end