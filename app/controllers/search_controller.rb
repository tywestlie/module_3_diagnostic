class SearchController < ApplicationController
  def index
    @stations = StationService.new(params[:q]).search_result
  end
end
