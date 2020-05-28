require 'pg'

class Spaces
  attr_reader :bedrooms, :location

  def initialize(bedrooms:, location:)
    @bedrooms = bedrooms
    @location = location
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
      Spaces.new(location: space['location'], bedrooms: space['bedrooms'])
    end
  end

  def self.add(bedrooms:, location:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
      result = connection.exec("INSERT INTO spaces (bedrooms, location) VALUES('#{bedrooms}', '#{location}') RETURNING bedrooms, location;")
      Spaces.new(bedrooms: result[0]['bedrooms'], location: result[0]['location'])
  end
end
