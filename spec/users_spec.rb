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
      connection.exec("INSERT INTO users (name) VALUES ('Phillip');")
      connection.exec("INSERT INTO users (name) VALUES('Jamie');")
      connection.exec("INSERT INTO users (name) VALUES('Susan');")

      users = Users.all

      expect(users).to include('Phillip')
      expect(users).to include('Jamie')
      expect(users).to include('Susan')
    end
  end
end
