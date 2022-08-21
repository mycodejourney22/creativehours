class ArtistsController < ApplicationController
  skip_before_action :authenticate_artist!, only: :show
  before_action :set_artist, only: [:follow, :unfollow, :show]

  def show
    @art = Art.new
    @art4 = Art.all.sample(4)
  end

  def mycart
    @art = Art.new
    @arts = Art.find(session[:cart]) if session[:cart]
    @total = total_price
  end

  def follow
    if current_artist.follow(@artist.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    end
  end

  def unfollow
    if current_artist.unfollow(@artist.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render action: :follow }
      end
    end
  end

  private

  def total_price
    sum = 0
    if @arts
      @arts.each do |art|
        sum += art.price
      end
    end
    return sum
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
