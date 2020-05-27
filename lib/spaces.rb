require 'pg'

class Spaces

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
    result.map { |space| space['property_name'] }
  end 

  def self.add(property_name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
  
    connection.exec("INSERT INTO spaces (property_name) VALUES('#{property_name}')")
  end
end
