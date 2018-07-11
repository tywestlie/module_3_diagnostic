class StationService
  def initialize(zip)
    @zip = zip
  end

  def search_result
    data[:fuel_stations].map do |s|
      Station.new(s)
    end
  end

  private
    attr_reader :zip

    def response
      Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{@zip}&fuel_type=E85,ELEC&radius=10&limit=10&api_key=#{ENV['NREL_API_KEY']}&format=JSON")
    end

    def data
      JSON.parse(response.body, symbolize_names: true)
    end
end
