require "./lib/bookings.rb"

describe Bookings do
  it 'can list dates a place is booked' do
    booking = Bookings.new(property_name: "Holiday home", start_date: 2010-01-01, end_date: 2010-01-02)
    expect(booking).to be_instance_of Bookings
  end
  
  it 'can make a booking' do
    booking = Bookings.add(property_name: "Holiday home", start_date: 2010-01-01, end_date: 2010-01-02)
    
    expect(Bookings.all.first).to eq 2010-01-01
    expect(Bookings.all.last).to eq 2010-01-02
  end
end

