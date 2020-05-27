def connect_and_add_spaces
  connection = PG.connect(dbname: 'makers_bnb_test')

  connection.exec("INSERT INTO spaces (bedrooms, location, property_name, description, space_type, guests, beds, bathrooms, amenities) VALUES(2, 'Peckham')")
  connection.exec("INSERT INTO spaces (bedrooms, location, property_name, description, space_type, guests, beds, bathrooms, amenities) VALUES(10, 'Hertfordshire')")
  connection.exec("INSERT INTO spaces (bedrooms, location, property_name, description, space_type, guests, beds, bathrooms, amenities) VALUES(3, 'Canary Wharf')")
end
