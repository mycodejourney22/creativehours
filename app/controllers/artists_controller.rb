class ArtistsController < ApplicationController
  skip_before_action :authenticate_artist!, only: :show
  def show
    @artist = Artist.find(params[:id])
    @art4 = Art.all.sample(4)
  end

  def mycart
    @art = Art.new
    @arts = Art.find(session[:cart]) if session[:cart]
    @total = total_price
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
end
