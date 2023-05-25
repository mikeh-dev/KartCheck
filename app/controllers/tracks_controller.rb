class TracksController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def index 
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    if current_user&.admin?
      @track = Track.new(track_params)
      if @track.save
        redirect_to @track, notice: "Track created successfully."
      else
        render :new
      end
    else
      redirect_to root_path, alert: "Cannot create a track due to not being an admin"
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to @track
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_path
  end

  private

  def track_params
    params.require(:track).permit(:name, :overview, :image, :logo, :website, :length, :address, :phone, pictures: [])
  end
  
  
  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
  
end
