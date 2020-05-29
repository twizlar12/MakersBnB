feature 'Adding a new space' do
  scenario 'user can add a space' do
    visit('/spaces/new')
  
    fill_in('property_name', with: 'Town House')
    fill_in('location', with: 'London')
    fill_in('bedrooms', with: 1)
    click_button('Add')

    expect(page).to have_content 'London'
    expect(page).to have_content 1
  end
end
