require 'rails_helper'

RSpec.describe Studio, type: :feature do 

  describe "As a visitor" do 

    before :each do 
      @studio1 = Studio.create!({name: "LucasFilms"})
      movie1_info = {name: "Star Wars 1", creation_year: 1981, genre: "fantastic"}
      @studio1.movies.create!(movie1_info)
      movie2_info = {name: "Star Wars 2", creation_year: 1985, genre: "fantastic"}
      @studio1.movies.create!(movie2_info)
      movie3_info = {name: "Star Wars 3", creation_year: 1987, genre: "fantastic"}
      @studio1.movies.create!(movie3_info)

      @studio2 = Studio.create!({name: "Pixar"})
      movie4_info = {name: "Toys Story 1", creation_year: 2006, genre: "animation"}
      @studio2.movies.create!(movie4_info)
      movie5_info = {name: "Toys Story 2", creation_year: 2008, genre: "animation"}
      @studio2.movies.create!(movie5_info)
      movie6_info = {name: "Toys Story 3", creation_year: 2010, genre: "animation"}
      @studio2.movies.create!(movie6_info)

    end

    it "the index page of a studio shows a list of movies for that studio" do

      visit "/studios"

      within("div#studio_#{@studio1.id}") do
        expect(page).to have_content("Name: LucasFilms")
        expect(page).to have_content("Star Wars 1")
        expect(page).to have_content("Star Wars 2")
        expect(page).to have_content("Star Wars 3")
      end

      within("div#studio_#{@studio2.id}") do
        expect(page).to have_content("Name: Pixar")
        expect(page).to have_content("Toys Story 1")
        expect(page).to have_content("Toys Story 2")
        expect(page).to have_content("Toys Story 3")
      end

      
    end

#     Story 1
# As a user, 
# When I visit the studio index page
# I see a list of all of the movie studios 
# And underneath each studio, I see the names of all of its movies.



  end

end