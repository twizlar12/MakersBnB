feature "signup" do
  scenario "check signup page has the right boxes" do
    visit '/signup'
    expect(page).to have_content "Email address"
    expect(page).to have_content "Password"
    expect(page).to have_content "Choose a user type"
  end

  scenario "check href link works" do
    visit '/signup'
    fill_in('name', with: 'Jeffery')
    fill_in('inputPassword', with: 'pass')
    select("Landlord", from: "userType").select_option
    click_button "Create your account"

    expect(page).to have_content "Spaces" # Is sign in a button, if so we can use have_button matcher
  end

  scenario "check href link works" do
    visit '/'
    click_link "Sign up"
    expect(page).to have_content "Please sign up"
  end
end
