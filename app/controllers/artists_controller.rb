class ArtistsController < ApplicationController
  skip_before_action :authenticate_artist!, only: :show
  def show
    @artist = Artist.find(params[:id])
    @art4 = Art.all.sample(4)
  end

  def mycart
    @arts = Art.find(session[:cart])
  end

end
