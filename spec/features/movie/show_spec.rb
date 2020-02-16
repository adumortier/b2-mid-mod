require 'rails_helper'

RSpec.describe Movie, type: :feature do 

  describe "As a visitor" do 

#     As a user, 
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre, 
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors 


    before :each do 
      studio1 = Studio.create!({name: "LucasFilms"})
      movie1_info = {name: "Star Wars 1", creation_year: 1981, genre: "fantastic"}

      @movie1 = studio1.movies.create!(movie1_info)
      
      actor1_info = {name: "Ford", age: 78}
      @actor1 = Actor.create!(actor1_info)
      
      actor2_info = {name: "Fisher", age: 80}
      @actor2 = Actor.create!(actor2_info)

      actor3_info = {name: "Shubaka", age: 82}
      @actor3 = Actor.create!(actor3_info)

      actor4_info = {name: "David", age: 82}
      @actor4 = Actor.create!(actor4_info)
    
      @movie1.actors << @actor1
      @movie1.actors << @actor2
      @movie1.actors << @actor3

    end

    it "the show page of a movie shows the list of actors for alphabetical order" do

      visit "/movies/#{@movie1.id}"

        expect(page).to have_content("Name: Star Wars 1")
        expect(page).to have_content("Creation year: 1981")
        expect(page).to have_content("Genre: fantastic")
        expect(page).to have_content("Actors: Fisher Ford Shubaka")
        expect(page).to have_content("Average age of actors: 80")

    end

    it "the show page has a form to allow the user to enter an actor name" do
  
      visit "/movies/#{@movie1.id}"

      fill_in 'Name', with: "David"
      click_button 'Submit'

      expect(current_path).to eq("/movies/#{@movie1.id}")
      expect(page).to have_content("Actors: David Fisher Ford Shubaka")
    end

# Story 4
# As a user,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
# St

  end

end