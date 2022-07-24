class ArtsController < ApplicationController
  def show
    @art = Art.find(params[:id])
  end

  def create
    @artist = Artist.find(current_artist.id)
    @art = Art.new(strong_params)
    @art.artist = @artist
    if @art.save
      redirect_to artist_path(current_artist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:art).permit(:image_url, :description, :price, :photo)
  end
end
