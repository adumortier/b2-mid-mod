require 'rails_helper'

RSpec.describe Actor, type: :model do 

  describe 'validations' do 
    it {should validate_presence_of :name} 
    it {should validate_presence_of :age} 
  end

  describe 'relationships' do
    it {should have_many(:actor_movies)}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'methods' do
    
    describe '#has_worked_with' do 

      it "can return a list of all actors the actor has worked with" do 

        actor1_info = {name: "Harrisson Ford", age: 78}
        @actor1 = Actor.create!(actor1_info)

        @studio1 = Studio.create!({name: "LucasFilms"})

        movie1_info = {name: "Indiana Jones 1", creation_year: 1986, genre: "adventure"}
        @movie1 = @studio1.movies.create!(movie1_info)
        movie2_info = {name: "Indiana Jones 2", creation_year: 1988, genre: "adventure"}
        @movie2 = @studio1.movies.create!(movie2_info)
        movie3_info = {name: "Indiana Jones 3", creation_year: 1991, genre: "adventure"}
        @movie3 = @studio1.movies.create!(movie3_info)

        @actor1.movies << @movie1
        @actor1.movies << @movie2
        @actor1.movies << @movie3

        actor2_info = {name: "Fisher", age: 80}
        actor2 = Actor.create!(actor2_info)

        actor3_info = {name: "Shubaka", age: 82}
        actor3 = Actor.create!(actor3_info)

        @movie1.actors << actor2 
        @movie2.actors << actor2
        @movie2.actors << actor3
        
        expect(@actor1.has_worked_with).to eq(["Fisher", "Shubaka"])

      end

    end
  
  end



end