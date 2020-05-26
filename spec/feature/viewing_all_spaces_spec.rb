require "database_helper.rb"

feature 'Viewing all spaces' do
  scenario 'To be able to make a valid booking' do
    visit('/spaces')
    expect(page).to have_content "Spaces"
  end

  scenario 'View all space stored' do
    connect_and_add_spaces

    visit('/spaces')
    
    expect(page).to have_content "2 bed in Peckham"
    expect(page).to have_content "10 bed in Hertfordshire"
    expect(page).to have_content "3 bed penthouse Canary Wharf"
  end
end
