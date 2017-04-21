class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@album.band_id)
    end
  end

  def edit
    @album = Album.find(params[:id])
    if @album
      render :edit
    else
      flash[:errors] = 'Can not find this album'
      redirect_to bands_url
    end
  end

  def show
    @album = Album.find(params[:id])
    if @album
      render :show
    else
      flash[:errors] = 'Can not find this album'
      redirect_to bands_url
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = 'Can not find this album'
      redirect_to bands_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to bands_url
    else
      flash[:errors] = 'Can not find this album'
      redirect_to bands_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :category, :band_id)
  end
end
