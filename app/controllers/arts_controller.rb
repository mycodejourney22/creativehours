class ArtsController < ApplicationController
  def show
    @art = Art.find(params[:id])
  end

  def index
    @arts = Art.all
    @art4 = Art.all.sample(4)
    if params[:query].present?
      @arts = Art.search_by_description_artist(params[:query])
    else
      # @artists = Artist.all
      @arts = Art.all
    end
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
