class ServiceRecordsController < ApplicationController
  def create
    @engine = Engine.find(params[:engine_id])
    @service_record = @engine.service_records.create(service_record_params)
    redirect_to engine_path(@engine)
  end

  private

  def service_record_params
    params.require(:service_record).permit(:description, :attachment)
  end
end
