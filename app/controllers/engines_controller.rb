class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @engines = current_user.admin? ? Engine.all : current_user.engines
  end

  def show
  end

  def new
    @engine = Engine.new
    @users = User.all if current_user.admin?
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
      @users = User.all if current_user.admin?
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.all if current_user.admin?
  end

  def update
    if @engine.update(engine_params)
      redirect_to user_dashboard_path, notice: "Engine updated successfully."
    else
      @users = User.all if current_user.admin?
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @engine.destroy
    redirect_to user_dashboard_path, notice: "Engine deleted successfully."
  end

  private
  def engine_params
    Rails.logger.debug "Is Admin: #{current_user.admin?}"
    if current_user.admin?
      params.require(:engine).permit(:make, :model, :engine_number, :user_id, :stolen_status, :current_seal, :barrel_number, :year)
    else
      params.require(:engine).permit(:make, :model, :engine_number, :stolen_status, :current_seal, :barrel_number, :year)
    end
  end

  def set_engine
    @engine = Engine.find(params[:id])
  end
  
  def authorize_user
    engine = Engine.find(params[:id])
    if current_user.admin? || engine.user == current_user
      return true
    else
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_path
    end
  end

end