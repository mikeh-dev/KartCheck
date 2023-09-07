class SearchController < ApplicationController
  def index
    if params[:q].present?
      @engines = Engine.where("LOWER(engine_number) = ?", params[:q].downcase)
      @chassis = Chassis.where("LOWER(number) = ?", params[:q].downcase)
    else
      @engines = Engine.none
      @chassis = Chassis.none
    end
    redirect_to your_path_here(anchor: 'search-results')
  end
end
