feature 'checking if a space is available' do
  scenario 'I can see the dates a space is taken' do
    connect_and_add_spaces
    visit('/spaces')
    expect(page).to have_content 'Dates unavailable:'
  end
end
