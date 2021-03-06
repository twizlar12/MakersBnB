 require "./lib/bookings.rb"
 require "./lib/spaces.rb"

describe Bookings do
  it 'can is a class of Bookings' do
    booking = Bookings.new(property_name: "Holiday home", start_date: '2010-01-01', end_date: '2010-01-02')
    expect(booking).to be_instance_of Bookings
  end
  
  it 'can make a booking' do
    Spaces.add(property_name: "Holiday home", location:'Birmingham', bedrooms: 5)
    booking = Bookings.add(property_name: "Holiday home", start_date: '2010-01-01', end_date: '2010-01-02')
    
    expect(Bookings.all.first.start_date).to eq '2010-01-01'
    expect(Bookings.all.first.end_date).to eq '2010-01-02'
  end
end
