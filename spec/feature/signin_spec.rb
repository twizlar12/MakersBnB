feature "signin" do
  scenario 'check user prompted for email address and password' do
    visit '/'
    expect(page).to have_content "Email address"
    expect(page).to have_content "Password"
  end 
  scenario "check href link works" do 
    visit '/'
    click_link "Sign up"
    expect(page).to have_content "Please sign up"
  end
end 