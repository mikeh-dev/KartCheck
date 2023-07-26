class ChassisController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, except: [:index, :new, :create]
  

  def index
    @chassis = current_user.chassis
  end

  def show
    @chassis = Chassis.find(params[:id])
  end

  def new
    @users = User.all
    @chassis = Chassis.new
  end

  def edit
    @users = User.all
    @chassis = Chassis.find(params[:id])
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

    def chassis_params
      params.require(:chassis).permit(:name, :make, :model, :number, :colour, :notes, :year).merge(user_id: current_user.id)
    end

    def authorize_user
      chassis = Chassis.find(params[:id])
      unless chassis.user == current_user
        flash[:alert] = 'You are not authorized to view this page.'
        redirect_to root_path
      end
    end
end
