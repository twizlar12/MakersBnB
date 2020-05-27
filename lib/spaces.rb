require 'pg'

class Spaces
  attr_reader :bedrooms, :location, :property_name, :description, :space_type, :guests, :beds, :bathrooms, :amenities

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
      Spaces.new(location: space['location'], bedrooms: space['bedrooms'], property_name: space['property_name'], description: space['description'], space_type: space['space_type'], guests: space['guests'], beds: space['beds'], bathrooms: space['bathrooms'], amenities: space['amenities'])
    end
  end

  def self.add(bedrooms:, location:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
      result = connection.exec("INSERT INTO spaces (bedrooms, location, property_name, description, space_type, guests, beds, bathrooms, amenities) VALUES('#{bedrooms}', '#{location}' '#{property_name}', '#{description}', '#{space_type}', '#{guests}', '#{beds}', '#{bathrooms}', '#{amenities}')) RETURNING bedrooms, location, property_name, description, space_type, guests, beds, bathrooms, amenities;")
      Spaces.new(bedrooms: result[0]['bedrooms'], location: result[0]['location'], property_name: result[0]['property_name'], description: result[0]['description'], beds: result[0]['beds'], bathrooms: result[0]['bathrooms'], amenities: [0]['amenities'])
  end

  def initialize(bedrooms:, location:, property_name:, description:, space_type:, guests:, beds:, bathrooms:, amenities:)
    @bedrooms = bedrooms
    @location = location
    @property_name = property_name
    @description = description
    @space_type = space_type
    @guests = guests
    @beds = beds
    @bathrooms = bathrooms
    @amenities = amenities
  end

end
