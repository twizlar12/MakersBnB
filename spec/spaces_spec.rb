require "./lib/spaces.rb"
require "database_helper.rb"

describe Spaces do
  it "should create an instance of itself" do
    space = Spaces.new(location:'Birmingham', bedrooms: 5, property_name: 'bobs house', description: 'very nice', space_type: 'attic', guests: 4, beds: 4, bathrooms: 2, amenities: 'none')
    expect(space).to be_instance_of Spaces
  end

  describe '.all' do
    it 'returns all spaces' do
      connect_and_add_spaces

      spaces = Spaces.all

      expect(spaces).to include('Peckham')
      expect(spaces).to include('Hertfordshire')
      expect(spaces).to include('Canary Wharf')
    end
  end

  describe '.create' do
    it 'creates a new space' do
      Spaces.add(bedrooms: 4, location: 'York')

      expect(Spaces.all).to include 'York'
    end
  end
end
