require_relative '../rails_helper'

RSpec.describe Movie, type: :model do 

  describe 'validations' do 
    it {should validate_presence_of :name, :creation_year, :genre}
  end

  describe 'relationships' do
    it {should belong_to :studio}
  end

  # describe 'methods' do 
  # end

end
