class EnginesController < ApplicationController
  
  def index
    @q = Engine.ransack(params[:q])
    @engines = @q.result(distinct: true)
  end
end
