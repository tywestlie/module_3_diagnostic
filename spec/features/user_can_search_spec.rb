require 'rails_helper'

describe 'user can search for alt fuels' do
  it 'can use a zip code to find attributes' do
    # As a user
    # When I visit "/"
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    # And I click "Locate"
    # Then I should be on page "/search"
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
