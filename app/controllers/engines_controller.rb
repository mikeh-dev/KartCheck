class EnginesController < ApplicationController
  def index
    if params[:q].present?
      @engines = Engine.search_engine_number(params[:q])
    else
      @engines = Engine.none
    end
  end

end