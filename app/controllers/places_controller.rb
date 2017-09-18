class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @places = Place.all
  end
end
