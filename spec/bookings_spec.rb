require "./lib/bookings.rb"

describe Bookings do
  it 'can list dates a place is booked' do
    booking = Bookings.new(start_date: 2010/01/01, end_date: 2010/01/03)
    expect(booking).to be_instance_of Bookings
  end
end
