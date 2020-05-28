require 'pg'

def connect_and_add_spaces
  Spaces.add(bedrooms: 2, location: 'Peckham')
  Spaces.add(bedrooms: 10, location: 'Hertfordshire')
  Spaces.add(bedrooms: 3, location: 'Canary Wharf')
end

def sign_up_user
  visit '/signup'
  fill_in('name', with: 'Susan')
  fill_in('inputPassword', with: 'password')
  select("Landlord", from: "userType").select_option
  click_button "Create your account"
end
