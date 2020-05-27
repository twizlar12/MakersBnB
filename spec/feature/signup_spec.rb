feature "signup" do
  scenario "check signup page has the right boxes" do
    visit '/signup'
    expect(page).to have_content "Email address"
    expect(page).to have_content "Password"
    expect(page).to have_content "Confirm Password"
  end
  scenario "check href link works" do
    visit '/signup'
    fill_in('name', with: 'Jeffery')
    click_link "Sign in"

    expect(page).to have_content "Sign in"
  end
end
