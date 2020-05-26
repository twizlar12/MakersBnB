class Spaces

  def intitialize(name)
    @name = name
  end

  def add_booking(date)
    #send date to a database
  end

  def dates_booked
    #print all dates in database
  end

  def self.all
    [
      "2 bed in Peckham",
      "10 bed in Hertfordshire",
      "3 bed penthouse Canary Wharf"
    ]
  end 


end
