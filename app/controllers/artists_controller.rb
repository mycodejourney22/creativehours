class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @art4 = Art.all.sample(4)
  end

  def mycart
    @arts = Art.find(session[:cart])
  end

end
