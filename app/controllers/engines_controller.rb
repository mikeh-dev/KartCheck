class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, except: [:index, :new, :create]
  
  def index
    @engines = current_user.engines
  end

  def show
    @engine = Engine.find(params[:id])
    if @engine.user != current_user
      redirect_to root_path, alert: "You are not authorized to view this engine."
    end
  end

  def new
    @engine = Engine.new
    @users = User.all
  end

  def create
    if current_user.admin? && params[:engine][:user_id].present?
      @engine = Engine.new(engine_params)
      @engine.user = User.find(params[:engine][:user_id])
    else
      @engine = current_user.engines.new(engine_params)
    end
  
    if @engine.save
      redirect_to engines_path, notice: "Engine created successfully."
    else
      flash.now[:alert] = "Engine failed to save."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.all
    @engine = Engine.find(params[:id])
  end

  def update
    @engine = Engine.find(params[:id])
    if @engine.update(engine_params)
      redirect_to user_dashboard_path, notice: "Engine updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy
    redirect_to user_dashboard_path, notice: "Engine deleted successfully."
  end

  private

  def engine_params
    Rails.logger.debug "Is Admin: #{current_user.admin?}"
    if current_user.admin?
      params.require(:engine).permit(:make, :model, :engine_number, :user_id)
    else
      params.require(:engine).permit(:make, :model, :engine_number)
    end
  end
  
  

  def authorize_user
    engine = Engine.find(params[:id])
    unless engine.user == current_user
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_path
    end
  end

end