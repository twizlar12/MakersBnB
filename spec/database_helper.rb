def connect_and_add_spaces
  connection = PG.connect(dbname: 'makers_bnb_test')

  connection.exec("INSERT INTO spaces (bedrooms, location) VALUES(2, 'Peckham')")
  connection.exec("INSERT INTO spaces (bedrooms, location) VALUES(10, 'Hertfordshire')")
  connection.exec("INSERT INTO spaces (bedrooms, location) VALUES(3, 'Canary Wharf')")
end
