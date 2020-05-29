require "./lib/spaces.rb"
require "database_helper.rb"

describe Spaces do
  it "should create an instance of itself" do
    space = Spaces.new(property_name: 'Student flat', location: 'Birmingham', bedrooms: 5)
    expect(space).to be_instance_of Spaces
  end

  describe '.all' do
    it 'returns all spaces' do
      connect_and_add_spaces

      spaces = Spaces.all

      expect(spaces.length).to eq 3
      expect(spaces.first.location).to eq('Peckham')
      expect(spaces.last.location).to eq('Canary Wharf')
    end
  end

  describe '.create' do
    it 'creates a new space' do
      Spaces.add(property_name: 'Crash Pad', bedrooms: 4, location: 'York')

      expect(Spaces.all.first.location).to eq 'York'
    end
  end
end
