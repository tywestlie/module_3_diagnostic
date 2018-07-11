require 'rails_helper'

describe 'user can search for alt fuels' do
  it 'can use a zip code to find attributes' do
    visit '/'

    fill_in :q, with: 80203

    VCR.use_cassette('features/user_can_search_by_zip') do
      click_on 'Locate'

      expect(current_path).to eq(search_path)

      expect(page).to have_css('.station', count: 10)

      within(first('.station')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.address')
        expect(page).to have_css('.fuel_type')
        expect(page).to have_css('.distance')
        expect(page).to have_css('.access_time')
      end
    end
  end
end
