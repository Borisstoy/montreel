class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :filters, :fetch_place_data ]
  before_action :set_places, only: [:show]

  include GeocoderHelper

  def index
    center_map(Place)
    places_markers
    filters
    respond_to do |format|
      format.js
      format.html
    end
  end

  def places_markers
    @filtered_places = Place.all
    display_places_markers(@filtered_places)
  end

  def filters
    places_kind = params[:kind] if params[:kind].present?
    @places_by_kind = Place.where(kind: places_kind)
    @places_by_kind = @places_by_kind.decorate
    respond_to do |format|
      format.js
      format.html
    end
    gon.markers = @places_markers
  end

  def markers
  end

  private

  def set_places
    @place = Place.find params[:id]
  end

  def permit_nested_params
    params.require(:place).permit(monument_summary_attributes: [:collection_name_fr,
                                                                :collection_name_en,
                                                                :category_fr,
                                                                :category_en,
                                                                :sub_category_fr,
                                                                :sub_category_en,
                                                                :materials_fr,
                                                                :materials_en,
                                                                :tech_fr,
                                                                :tech_en,
                                                                :artist_name,
                                                                :artist_last_name,
                                                                :park,
                                                                :building])
  end
end
