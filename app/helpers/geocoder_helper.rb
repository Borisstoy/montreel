module GeocoderHelper
  def center_map(collection)
    location = "Montreal, QC"
    within_area(collection, geocoder(location))
  end

  def within_area(collection, box)
    @geocoded_places = collection.within_bounding_box(box)
  end

  def geocoder(location)
    center = Geocoder.search(location)
    bounds = center.first.geometry['bounds'] || Geocoder.search("Montreal, QC, Canada").first.geometry['bounds']
    box = [
      bounds['southwest']['lat'],
      bounds['southwest']['lng'],
      bounds['northeast']['lat'],
      bounds['northeast']['lng'],
    ]
  end

  def build_places_markers(places)
    places_coordinates = []
    places_markers     = []

    places.each do |place|
      coord = {
        lat: place.lat,
        lng: place.lng
      }
      places_coordinates << coord

      marker = {}

      marker[:place_lat] = place.lat
      marker[:place_lng] = place.lng
      marker[:infowindow] = render_to_string(
                                partial: "infowindow.html.slim",
                                formats: [:html],
                                layout: false,
                                locals: {place: place},
                                cache: true)

      places_markers << marker
    end
    return places_markers
  end

  def display_places_markers(places)
    @places_markers = build_places_markers(@filtered_places)
  end
end
