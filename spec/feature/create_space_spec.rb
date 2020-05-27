feature 'Adding a new space' do
  scenario 'user can add a space' do
    visit('/spaces/new')
  
    fill_in('property_name', with: '1 Bed at Tower of London')
    click_button('Submit')

    expect(page).to have_content '1 Bed at Tower of London'
  end
end
