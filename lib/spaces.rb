require 'pg'

class Spaces
  attr_reader :bedrooms, :location, :property_name

  def initialize(property_name:, bedrooms:, location:)
    @bedrooms = bedrooms
    @location = location
    @property_name = property_name
  end

  def add_booking(date)
    #send date to a database
  end

  def dates_booked
    #print all dates in database
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM spaces;")
    result.map do |space|
      Spaces.new(property_name: space['property_name'], location: space['location'], bedrooms: space['bedrooms'])
    end
  end

  def self.add(property_name:, bedrooms:, location:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
      result = connection.exec("INSERT INTO spaces (property_name, bedrooms, location) VALUES('#{property_name}','#{bedrooms}', '#{location}') RETURNING property_name, bedrooms, location;")
      Spaces.new(property_name: result[0]['property_name'], bedrooms: result[0]['bedrooms'], location: result[0]['location'])
  end
end
