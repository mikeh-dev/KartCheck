class EnginesController < ApplicationController
  def search
    @engines = Engine.where('engine_number ILIKE ?', "%#{params[:engine_number]}%")
    render turbo_stream: turbo_stream.replace('engine-results', partial: 'engines/search_results')
  end
  
  
end
