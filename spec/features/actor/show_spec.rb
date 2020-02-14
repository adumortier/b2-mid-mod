require 'rails_helper'

RSpec.describe Actor, type: :feature do 

#   Story 2
# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.


  describe "As a visitor" do 

    before :each do 
      actor1_info = {name: "Harrisson Ford", age: 78}
      @actor1 = Actor.create!(actor1_info)

      @studio1 = Studio.create!({name: "LucasFilms"})

      movie1_info = {name: "Indiana Jones 1", creation_year: 1986, genre: "adventure"}
      movie1 = @studio1.movies.create!(movie1_info)

      movie2_info = {name: "Indiana Jones 2", creation_year: 1988, genre: "adventure"}
      movie2 = @studio1.movies.create!(movie2_info)

      movie3_info = {name: "Indiana Jones 3", creation_year: 1991, genre: "adventure"}
      movie3 = @studio1.movies.create!(movie3_info)

      @actor1.movies << movie1
      @actor1.movies << movie2
      @actor1.movies << movie3
    end

    it "the show page of an actor shows his/her name and the movies (s)he is in" do

      visit "/actors/#{@actor1.id}"

      expect(page).to have_content("Name: Harrisson Ford")
      expect(page).to have_content("Indiana Jones 1")
      expect(page).to have_content("Indiana Jones 2")
      expect(page).to have_content("Indiana Jones 3")

      end
      
    end
end
