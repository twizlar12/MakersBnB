require "./lib/users.rb"
require "database_helper.rb"

describe Users do
  it "creates a new instance of itself" do
    user = Users.new(name: 'newuser', password: 'newpassword', user_type: 'Landlord')
    expect(user).to be_instance_of Users
  end

  describe '.all' do
    it 'contains all the signed up users' do
      users = Users.signup(name: "Phillip", password: "pjohns243", user_type: "Guest")
      Users.signup(name: "Jamie", password: "jmorris379", user_type: 'Landlord')
      Users.signup(name: "Susan", password: "pinkhearts65", select user_type: 'Guest')

      users = Users.all

      expect(users.first).to be_a Users
      expect(users.first.name).to eq 'Phillip'
      expect(users.length).to eq 3
    end
  end

  # fill_in('inputPassword', with: 'password')
  # select("Landlord", from: "userType").select_option

  # describe '.signup' do
  #   it 'adds a user to the database through sign up' do
  #     user = Users.signup(name: 'Jeffery', password: 'jkola12', select "Landlord", :from => "userType")
  #
  #     expect(user).to be_a Users
  #     expect(user.name).to eq 'Jeffery'
  #   end
  # end
  #
  # describe '.signin' do
  #   it 'allows existing users to sign in' do
  #     Users.signup(name: "Susan", password: "pinkhearts65", select "Landlord", :from => "userType")
  #     user = Users.signin(name: 'Susan', password: 'pinkhearts65')
  #
  #     users = Users.all
  #     expect(users.first.name).to include 'Susan'
  #   end
  # end
#
 end
