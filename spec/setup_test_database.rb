require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE bookings;")
  connection.exec("TRUNCATE spaces CASCADE;")
  connection.exec("TRUNCATE users;")
end
