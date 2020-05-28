require 'pg'

def connect_and_add_spaces

  Spaces.add(bedrooms: 2, location: 'Peckham')
  Spaces.add(bedrooms: 10, location: 'Hertfordshire')
  Spaces.add(bedrooms: 3, location: 'Canary Wharf')
end
