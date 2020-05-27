require "database_helper.rb"

feature 'Viewing all spaces' do
  scenario 'To be able to make a valid booking' do
    visit('/spaces')
    expect(page).to have_content "Spaces"
  end

  feature "#spaces" do
    scenario 'View all space stored' do
      connect_and_add_spaces

      visit('/spaces')

      expect(page).to have_content "Peckham"
      expect(page).to have_content "Hertfordshire"
      expect(page).to have_content "Canary Wharf"
    end
  end
end
