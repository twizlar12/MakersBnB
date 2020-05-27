require "./lib/users.rb"

describe Users do
  it "creates a new instance of itself" do
    user = Users.new(name: 'newuser', password: 'newpassword')
    expect(user).to be_instance_of Users
  end

  describe '.all' do
    it 'contains all the signed up users' do

      connection = PG.connect(dbname: 'makers_bnb_test')

    # Add the test data
      # connection.exec("INSERT INTO users (name) VALUES ('Phillip');")
      # connection.exec("INSERT INTO users (name) VALUES('Jamie');")
      # connection.exec("INSERT INTO users (name) VALUES('Susan');")

      user = User.signup(name: 'Phillip', password: 'pjohns243')
      User.signup(name: 'Jamie', password: 'james.ph!')
      User.signup(name: 'Susan', password: 'pinkhearts65')

      users = Users.all

      expect(users.first).to be_a Users
      expect(users.first.name).to eq 'Philip'
      expect(users.length).to eq 3 
    end
  describe '.signup' do
    it 'adds a user to the database through sign up' do
      user = Users.signup(name: 'Jeffery', password: 'jkola12')
      persisted_data = PG.connect(dbname: 'makers_bnb_test').query("SELECT name FROM users WHERE name LIKE 'Jeffery%';")
      expect(Users.all).to include 'Jeffery'
    end 
  end 
end
end 
