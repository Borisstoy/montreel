class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :filters ]
  before_action :set_places, only: [:show]

  include GeocoderHelper

  def index
    center_map(Place)
    places_markers
    filters
  end

  def show
  end

  def places_markers
    @filtered_places = Place.all
    display_places_markers(@filtered_places)
  end

  def filters
    places_kind = params[:kind] if params[:kind].present?
    @places_by_kind = Place.where(kind: places_kind)
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def set_places
    @place = Place.find params[:id]
  end
end
