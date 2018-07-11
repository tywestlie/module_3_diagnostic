class StationSearch
  def initialize(zip)
    @zip = zip
  end

  def search_result

  end

  def search
    data = Faraday.get("https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/")

    JSON.parse(data.body, symbolize_names: true)
  end
end
