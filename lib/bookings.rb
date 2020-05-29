class Bookings

attr_reader :start_date, :end_date, :property_name

  def initialize(property_name:, start_date:, end_date:)
    @property_name = property_name
    @start_date = start_date
    @end_date = end_date
  end

  def self.add(property_name:, start_date:, end_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    bookings_result = connection.exec("SELECT * FROM bookings WHERE property_name = '#{property_name}' AND start_date = to_date('#{start_date}', 'YYYY-MM-DD');")
    return if bookings_result.any? 
    result = connection.exec("INSERT INTO bookings (property_name, start_date, end_date) VALUES('#{property_name}', to_date('#{start_date}', 'YYYY-MM-DD'), to_date('#{end_date}', 'YYYY-MM-DD')) RETURNING property_name, start_date, end_date;")
    Bookings.new(property_name: result[0]['property_name'], start_date: result[0]['start_date'], end_date: result[0]['end_date'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM bookings")
    result.map do |booking|
      Bookings.new(property_name: booking['property_name'], start_date: booking['start_date'], end_date: booking['end_date'])
    end
  end 
end
