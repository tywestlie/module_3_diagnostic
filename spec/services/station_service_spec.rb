require 'rails_helper'

describe StationService do
  describe 'stations' do
    it 'finds closest stations based on a zip code' do
      VCR.use_cassette('services/find_stations') do
        stations = StationService.new(80203).search_result
        station = stations.first

        expect(station.name).to eq('UDR')
        expect(station.address).to eq('800 Acoma St')
        expect(station.fuel_type).to eq('ELEC')
        expect(station.distance).to eq(0.31422)
        expect(station.access_time).to eq('24 hours daily')
      end
    end
  end
end
