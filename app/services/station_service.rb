class StationService
  def initialize(zip)
    @zip = zip
  end

  def search_result
    search.map do |s|
      Station.new(s)
    end
  end

  def search
    data = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{@zip}&fuel_type=E85,ELEC&radius=10&limit=10&api_key=#{ENV['NREL_API_KEY']}&format=JSON")

    parsed = JSON.parse(data.body, symbolize_names: true)

    parsed[:fuel_stations]
  end
end
