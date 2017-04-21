class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render :index
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url(@track.album_id)
    end
  end

  def edit
    @track = Track.find(params[:id])
    if @track
      render :edit
    else
      flash[:errors] = 'Can not find this track'
      redirect_to albums_url
    end
  end

  def show
    @track = Track.find(params[:id])
    if @track
      render :show
    else
      flash[:errors] = 'Can not find this track'
      redirect_to albums_url
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = 'Can not find this track'
      redirect_to albums_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      redirect_to albums_url
    else
      flash[:errors] = 'Can not find this track'
      redirect_to albums_url
    end
  end

  private

  def track_params
    params.require(:track).permit(:song, :kind, :album_id, :lyric)
  end
end
