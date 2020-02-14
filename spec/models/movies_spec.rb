require_relative '../rails_helper'

RSpec.describe Movie, type: :model do 

  describe 'validations' do 
    it {should validate_presence_of :name} 
    it {should validate_presence_of :creation_year} 
    it {should validate_presence_of :genre} 
  end

  describe 'relationships' do
    it {should belong_to :studio}
  end

  # describe 'methods' do 
  # end

end
