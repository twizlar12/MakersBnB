feature "signin" do
  scenario 'check user prompted for email address and password' do
    visit '/'
    fill_in('inputEmail', with: 'susan.m@hotmail.com')
    click_button "Sign in"
    expect(page).to have_content "Email address"
    expect(page).to have_content "Password"
  end 
  scenario "check href link works" do 
    visit '/'
    click_link "Sign up"
    expect(page).to have_content "Please sign up"
  end
end 