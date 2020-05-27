require 'pg'

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
    Users.new(name: result[0]['name'], password: result[0]['password'])
  end

  def self.signin(name:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("INSERT INTO users (name, password) VALUES('#{name}', '#{password}') RETURNING name, password;")
    Users.new(name: result[0]['name'], password: result[0]['password'])
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      Users.new(name: user['name'], password: user['password'])
    end
  end
end
