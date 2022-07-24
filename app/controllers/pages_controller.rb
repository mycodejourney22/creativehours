class PagesController < ApplicationController
  def home
    @art = Art.new
    @art4 = Art.all.sample(4)
    if params[:query].present?
      @arts = Art.search_by_description_artist(params[:query])
    else
      @artists = Artist.all
      @arts = Art.all
    end
  end

end
