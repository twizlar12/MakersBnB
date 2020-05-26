require "./lib/spaces.rb"
require "database_helper.rb"

describe Spaces do  
  it "should create an instance of itself" do 
    space = Spaces.new
    expect(space).to be_instance_of Spaces
  end

  describe '.all' do
    it 'returns all spaces' do
      connect_and_add_spaces

      spaces = Spaces.all

      expect(spaces).to include('2 bed in Peckham')
      expect(spaces).to include('10 bed in Hertfordshire')
      expect(spaces).to include('3 bed penthouse Canary Wharf')
    end
  end
end