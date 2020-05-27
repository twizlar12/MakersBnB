def connect_and_add_spaces
  connection = PG.connect(dbname: 'makers_bnb_test')

      connection.exec("INSERT INTO spaces (property_name) VALUES('2 bed in Peckham')")
      connection.exec("INSERT INTO spaces (property_name) VALUES('10 bed in Hertfordshire')")
      connection.exec("INSERT INTO spaces (property_name) VALUES('3 bed penthouse Canary Wharf')")
end