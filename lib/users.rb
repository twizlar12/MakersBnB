class Users
  
  attr_reader :name, :password

  def initialize(name:, password:)
    @name = name
    @password = password
  end

  def self.signup(name:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("INSERT INTO users (name, password) VALUES('#{name}', '#{password}') RETURNING name, password;")
    Users.new(name: ['name'], password: ['password'])
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
    Users.new(name: ['name'], password: ['password'])
  end 
end
