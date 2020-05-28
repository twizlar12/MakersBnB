require 'pg'

class Users

  attr_reader :name, :password, :user_type

  def initialize(name:, password:, user_type:)
    @name = name
    @password = password
    @user_type = user_type
  end

  def self.signup(name:, password:, user_type:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("INSERT INTO users (name, password, user_type) VALUES('#{name}', '#{password}', '#{user_type}') RETURNING name, password, user_type;")
    Users.new(name: result[0]['name'], password: result[0]['password'], user_type: result[0]['user_type'])
  end

  def self.signin(name:, password:, user_type:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT name, password, user_type FROM users WHERE name LIKE '#{name}%' AND password LIKE '#{password}%' AND user_type LIKE '#{user_type}';")
    Users.new(name: result[0]['name'], password: result[0]['password'], user_type: result[0]['user_type'])
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      Users.new(name: user['name'], password: user['password'], user_type: user['user_type'])
    end
  end
end
