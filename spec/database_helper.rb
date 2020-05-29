require 'pg'

def connect_and_add_spaces

  Spaces.add(property_name: 'New Build', bedrooms: 2, location: 'Peckham')
  Spaces.add(property_name: 'Prince Castle', bedrooms: 10, location: 'Hertfordshire')
  Spaces.add(property_name: 'Wharf Penthouse', bedrooms: 3, location: 'Canary Wharf')
end

def persisted_data_signup(name:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  result = connection.query("SELECT name FROM users WHERE name LIKE '#{name}%';")
  result.first
end

def persisted_data_signin(name:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  result = connection.query("SELECT name FROM users WHERE name LIKE '#{name}%';")
  result.first
end
