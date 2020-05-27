feature "signin" do
  scenario 'check user prompted for email address and password' do
    visit '/'
    fill_in('name', with: 'Susan')
    click_button "Sign in"
    expect(page).to have_content "Spaces"
    # This was failing becuase we are posting to spaces on app.rb so the content which was prev there didn't exist
  end
  scenario "check href link works" do
    visit '/'
    click_link "Sign up"
    expect(page).to have_content "Please sign up"
  end
end
