feature "signin" do
  scenario 'check user redirected to spaces after signing in' do
    visit '/'
    fill_in('name', with: 'Susan')
    fill_in('password', with: 'password')
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
