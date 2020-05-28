class Bookings

attr_reader :start_date, :end_date, :property_name

  def initialize(property_name:, start_date:, end_date:)
    @property_name = property_name
    @start_date = start_date
    @end_date = end_date
  end
end
