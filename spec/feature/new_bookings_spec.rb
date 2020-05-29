feature 'Adding a new booking' do
  scenario 'user can add a new booking' do
    visit('/spaces/new')
  
    fill_in('property_name', with: 'Richville')
    fill_in('location', with: 'London')
    fill_in('bedrooms', with: 1)
    click_button('Add')

    visit('/spaces/bookings')
  
    fill_in('property_name', with: 'Richville')
    fill_in('start_date', with: '2020-05-28')
    fill_in('end_date', with: '2020-05-29')
    click_button('Make Booking')

    expect(page).to have_content 'Richville'
    expect(page).to have_content 'Dates unavailable:'
    expect(page).to have_content '2020-05-28'
  end

  scenario 'user cannot add a new booking on unavailable dates' do
    visit('/spaces/new')
  
    fill_in('property_name', with: 'Richville')
    fill_in('location', with: 'London')
    fill_in('bedrooms', with: 1)
    click_button('Add')

    visit('/spaces/bookings')
  
    fill_in('property_name', with: 'Richville')
    fill_in('start_date', with: '2020-05-28')
    fill_in('end_date', with: '2020-05-29')
    click_button('Make Booking')

    visit('/spaces/bookings')
  
    fill_in('property_name', with: 'Richville')
    fill_in('start_date', with: '2020-05-28')
    fill_in('end_date', with: '2020-05-29')
    click_button('Make Booking')

    expect(page).to have_content 'Unable to make booking, as dates selected are already booked!'
  end
end
