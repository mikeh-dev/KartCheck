class EnginesController < ApplicationController
  def index
    if params[:q].present?
      @engines = Engine.where("LOWER(engine_number) = ?", params[:q].downcase)
    else
      @engines = Engine.none
    end
  end

  def new
    @engine = Engine.new
  end

  def create
    @engine = Engine.new(engine_params)
    if @engine.save
      redirect_to engines_path, notice: "Engine created successfully."
    else
      flash.now[:alert] = "Engine failed to save."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @engine = Engine.find(params[:id])
  end

  def edit
    @engine = Engine.find(params[:id])
  end

  def update
    @engine = Engine.find(params[:id])
    if @engine.update(engine_params)
      redirect_to dashboard_path, notice: "Engine updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy
    redirect_to dashboard_path, notice: "Engine deleted successfully."
  end

  private

  def engine_params
    params.require(:engine).permit(:make, :model, :engine_number).merge(user_id: current_user.id)
  end


end