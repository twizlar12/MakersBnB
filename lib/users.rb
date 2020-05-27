class Users

  def initialize(name, password)
    @name = name
    @password = password
  end

  def user_to_database
    #pass new user to database
  end

  def signin
    #verify user is in the database
  end

  def self. all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM users")
    result.map { |user| user['name'] }
  end 
end
