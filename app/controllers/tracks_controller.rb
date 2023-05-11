class TracksController < ApplicationController
  def index 
    @tracks = Track.all.with_attached_images
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.images.attach(params[:track][:images])
    if @track.save
      redirect_to track_path(@track)
    else
      render :new
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
    params.require(:track).permit(:name, :address, :phone, :email, :opening_time, :closing_time, :overview, :website, :length, :main_image, images: [])
  end
  
  
  
end
