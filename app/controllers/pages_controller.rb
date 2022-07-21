class PagesController < ApplicationController
  def home
    @artists = Artist.all
    @arts = Art.all
  end
end
