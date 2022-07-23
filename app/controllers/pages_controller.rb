class PagesController < ApplicationController
  def home
    @artist = Artist.find(current_artist.id)
    @art = Art.new
    @art4 = Art.all.sample(3)
    if params[:query].present?
      @arts = Art.search_by_description_artist(params[:query])
    else
      @artists = Artist.all
      @arts = Art.all
    end
  end

end
