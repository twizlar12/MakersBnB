feature "signin" do
  scenario 'check user redirected to spaces after signing in' do
    sign_up_user
    visit '/'
    fill_in('name', with: 'Susan')
    fill_in('inputPassword', with: 'password')
    select("Landlord", from: "userType").select_option
    click_button "Sign in"
    expect(page).to have_content "Spaces"
    # This was failing becuase we are posting to spaces on app.rb so the content which was prev there didn't exist
  end

  scenario "check href link works" do
    visit '/'
    click_link "Sign up"
    expect(page).to have_content "Please sign up"
  end

  scenario "landlord user can't sign in as guest" do
    sign_up_user
    visit '/'
    fill_in('name', with: 'Susan')
    fill_in('inputPassword', with: 'password')
    select("Guest", from: "userType").select_option
    click_button "Sign in"
    expect(page).to have_content "Your user information is incorrect!"
  end

  scenario "guest user can't sign in as a landlord" do
    visit '/signup'
    fill_in('name', with:'Bob')
    fill_in('inputPassword', with:'password')
    select("Guest", from: "userType").select_option
    click_button "Create your account"
    visit '/'
    fill_in('name', with:'Bob')
    fill_in('inputPassword', with:'password')
    select("Landlord", from: "userType").select_option
    click_button "Sign in"
    expect(page).to have_content "Your user information is incorrect!"
  end

  scenario "Signing in with a name that doesn't exist in the database" do
    visit '/'
    fill_in('name', with:'RandomName')
    fill_in('inputPassword', with:'Randompass')
    select("Guest", from: "userType").select_option
    click_button "Sign in"
    expect(page).to have_content "Your user information is incorrect!"
  end
end
