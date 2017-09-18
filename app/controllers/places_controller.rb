class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  include GeocoderHelper

  def index
    center_map(Place)
    filters
  end

  def filters
    @filtered_places = find_places
    display_places_markers(@filtered_places)
  end

  private

  def find_places
    @filtered_places = Place.all
  end
end
