class ChassisController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, except: [:index, :new, :create]
  

  def index
    @chassis = current_user.chassis
  end

  def show
    @chassis = Chassis.find(params[:id])
    if @chassis.user != current_user
      redirect_to root_path, alert: "You are not authorized to view this chassis."
    end
  end

  def new
    @users = User.all
    @chassis = Chassis.new
  end

  def create
    if current_user.admin? && params[:chassis][:user_id].present?
      @chassis = Chassis.new(chassis_params)
      @chassis.user = User.find(params[:chassis][:user_id])
    else
      @chassis = current_user.chassis.new(chassis_params)
    end

    if @chassis.save
      redirect_to chassis_path(@chassis), notice: "Chassis created successfully."
    else
      flash.now[:alert] = "Chassis failed to save."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.all
    @chassis = Chassis.find(params[:id])
  end

  def update
    @chassis = Chassis.find(params[:id])
    if @chassis.update(chassis_params)
      redirect_to chassis_path(@chassis), notice: "Chassis updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @chassis = Chassis.find(params[:id])
    @chassis.destroy
    redirect_to user_dashboard_path, notice: "Chassis deleted successfully."
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
