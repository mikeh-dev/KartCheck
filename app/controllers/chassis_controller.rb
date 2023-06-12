class ChassisController < ApplicationController
  before_action :set_chassis, only: %i[ show edit update destroy ]

  # GET /chassis or /chassis.json
  def index
    @chassis = Chassis.all
  end

  # GET /chassis/1 or /chassis/1.json
  def show
  end

  # GET /chassis/new
  def new
    @chassis = Chassis.new
  end

  # GET /chassis/1/edit
  def edit
  end

  # POST /chassis or /chassis.json
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

  # PATCH/PUT /chassis/1 or /chassis/1.json
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

  # DELETE /chassis/1 or /chassis/1.json
  def destroy
    @chassis.destroy

    respond_to do |format|
      format.html { redirect_to chassis_index_url, notice: "Chassis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chassis
      @chassis = Chassis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chassis_params
      params.require(:chassis).permit(:name, :make, :model, :number, :colour, :notes, :year)
    end
end
