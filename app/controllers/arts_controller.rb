class ArtsController < ApplicationController
  skip_before_action :authenticate_artist!, only: :index
  def show
    @art = Art.find(params[:id])
  end

  def index
    @art = Art.new
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
    @artist = current_artist
    @art = Art.new(strong_params)
    @art.artist = @artist
    if @art.save
      redirect_to artist_path(current_artist)
    else
      @arts = Art.first(16)
      @art4 = Art.all.sample(4)
      render "pages/home", status: :unprocessable_entity
    end
  end

  def cart
    id = params[:id].to_i
    session[:cart] ||= []
    session[:cart] << id
    redirect_to root_path
  end

  def toggle_favorite
    @art = Art.find_by(id: params[:id])
    current_artist.favorited?(@art) ? current_artist.unfavorite(@art) : current_artist.favorite(@art)
    respond_to do |format|
      format.json
      format.html
    end
  end

  private

  def strong_params
    params.require(:art).permit(:image_url, :description, :price, :photo)
  end
end
