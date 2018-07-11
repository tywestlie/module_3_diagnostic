require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'instance methods' do
    it 'has attributes' do
      attributes = {
        station_name: 'Gas shop',
        street_address: '123 address street',
        fuel_type_code: 'Nuclear',
        distance: 5.01,
        access_days_time: '24/7'
      }

    station = Station.new(attributes)

    expect(station.name).to eq('Gas shop')
    expect(station.address).to eq('123 address street')
    expect(station.fuel_type).to eq('Nuclear')
    expect(station.distance).to eq(5.01)
    expect(station.access_time).to eq('24/7')
    end
  end
end
