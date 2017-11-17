class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :filters ]
  before_action :set_places, only: [:show]

  include GeocoderHelper

  def index
    center_map(Place)
    monument_sub_categories_names
    places_markers
    filters
    respond_to do |format|
      format.js
      format.html
    end
  end

  def places_markers
    @all_places = Place.all
    @all_places = @all_places.decorate
    display_places_markers(@all_places)
  end

  def filters
    place_kind            = params[:kind]
    monument_sub_categoy  = params[:monument_cat]

    @filtered_places = []

    if place_kind.present?
      @filtered_places = Place.find_by_kind(place_kind)
    elsif monument_sub_categoy.present?
      monuments_sub_categories_filters(monument_sub_categoy)
    end

    @filtered_places = @filtered_places.map {|place| place.decorate }

    respond_to do |format|
      format.js
      format.html
    end

    gon.markers = @places_markers
  end

  private

  def monuments_sub_categories_filters(category_params)
    if category_params == (I18n.t 'all_categories')
      @filtered_places = Place.find_by_kind('Monument')
    elsif category_params != @all_categories
      @filtered_places = Place.monument_by_category(category_params)
    end
  end

  def monument_sub_categories_names
    @all_categories = (I18n.t 'all_categories')
    @monument_sub_categories_names =
      Place.pluck(:sub_category_fr)
           .uniq
           .unshift @all_categories
  end

  def set_places
    @place = Place.find params[:id]
  end
end
