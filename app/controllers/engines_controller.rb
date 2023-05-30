class EnginesController < ApplicationController
  def search
    if params[:engine_number].present?
      @engines = Engine.search(params[:engine_number])
    else
      @engines = []
    end
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('engine-results', partial: 'engines/search_results', locals: { engines: @engines })
      end
    end
  end

  def index 
    @engines = []
  end
end
