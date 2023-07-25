class ChassisController < ApplicationController
  before_action :set_chassis, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 

  def index
    @chassis = Chassis.all
  end

  def show
    if @chassis.user != current_user
      redirect_to root_path, alert: "You are not authorized to view this chassis."
    end
  end

  def new
    @chassis = Chassis.new
    @users = User.all
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
      format.html { redirect_to user_dashboard_path, notice: "Chassis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_chassis
      @chassis = Chassis.find(params[:id])
    end

    def chassis_params
      params.require(:chassis).permit(:name, :make, :model, :number, :colour, :notes, :year).merge(user_id: current_user.id)
    end
end
