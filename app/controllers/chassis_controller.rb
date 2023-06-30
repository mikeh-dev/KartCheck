class ChassisController < ApplicationController
  before_action :set_chassis, only: %i[ show edit update destroy ]

  def index
    @chassis = Chassis.all
  end

  def show
  end

  def new
    @chassis = Chassis.new
  end

  def edit
  end

  def create
    @chassis = Chassis.new(chassis_params)

    respond_to do |format|
      if @chassis.save
        format.html { redirect_to chassis_url(@chassis), notice: "Chassis was successfully created." }
        format.json { render :show, status: :created, location: @chassis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chassis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chassis.update(chassis_params)
        format.html { redirect_to chassis_url(@chassis), notice: "Chassis was successfully updated." }
        format.json { render :show, status: :ok, location: @chassis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chassis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chassis.destroy

    respond_to do |format|
      format.html { redirect_to chassis_index_url, notice: "Chassis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_chassis
      @chassis = Chassis.find(params[:id])
    end

    def chassis_params
      params.require(:chassis).permit(:name, :make, :model, :number, :colour, :notes, :year)
    end
end
