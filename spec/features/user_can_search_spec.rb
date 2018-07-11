require 'rails_helper'

describe 'user can search for alt fuels' do
  it 'can use a zip code to find attributes' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    # save_and_open_page
    fill_in :q, with: 80203
    # And I click "Locate"
    click_on 'Locate'
    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content('10 stations')
    # And the stations should be limited to Electric and Propane
    expect(page).to have_css('.station', count: 10)
    
    within('.station') do
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.fuel_type')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.access_time')
    end
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
