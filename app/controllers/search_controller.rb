class SearchController < ApplicationController
  def index
    if params[:q].present?
      @engines = Engine.where("LOWER(engine_number) = ?", params[:q].downcase)
    else
      @engines = Engine.none
    end
  end
end
