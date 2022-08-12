class PagesController < ApplicationController
  skip_before_action :authenticate_artist!, only: :home
  def home
    @art = Art.new
    @art4 = Art.all.sample(4)
    if params[:query].present?
      @arts = Art.search_by_description_artist(params[:query])
    else
      @artists = Artist.all
      @arts = Art.first(16)
    end
  end

end
