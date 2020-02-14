require_relative '../rails_helper'

RSpec.describe Movie, type: :model do 

  describe 'validations' do 
    it {should validate_presence_of :name} 
    it {should validate_presence_of :creation_year} 
    it {should validate_presence_of :genre} 
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actor_movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'methods' do 

    it "can return a list of actors for a movie in alphabetical order" do
      studio1 = Studio.create!({name: "LucasFilms"})
      movie1_info = {name: "Star Wars 1", creation_year: 1981, genre: "fantastic"}

      movie1 = studio1.movies.create!(movie1_info)
      
      actor1_info = {name: "Ford", age: 78}
      actor1 = Actor.create!(actor1_info)
      
      actor2_info = {name: "Fisher", age: 83}
      actor2 = Actor.create!(actor2_info)

      actor3_info = {name: "Shubaka", age: 783}
      actor3 = Actor.create!(actor3_info)
    
      movie1.actors << actor1
      movie1.actors << actor2
      movie1.actors << actor3        

      expect(movie1.list_actors).to eq([actor2, actor1, actor3])
    end


    it "can return the average age of actors in a movie" do
      studio1 = Studio.create!({name: "LucasFilms"})
      movie1_info = {name: "Star Wars 1", creation_year: 1981, genre: "fantastic"}

      movie1 = studio1.movies.create!(movie1_info)
      
      actor1_info = {name: "Ford", age: 78}
      actor1 = Actor.create!(actor1_info)
      
      actor2_info = {name: "Fisher", age: 80}
      actor2 = Actor.create!(actor2_info)

      actor3_info = {name: "Shubaka", age: 82}
      actor3 = Actor.create!(actor3_info)
    
      movie1.actors << actor1
      movie1.actors << actor2
      movie1.actors << actor3        

      expect(movie1.average_age).to eq(80)
    end

  end

end
