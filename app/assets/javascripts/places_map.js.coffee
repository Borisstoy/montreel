window.initMap = ->

  mapContainer = $('#places-map')

  place =

    lng: parseFloat(mapContainer.attr('data-longitude'))
    lat: parseFloat(mapContainer.attr('data-latitude'))

  map = new (google.maps.Map)(document.getElementById('places-map'),
    zoom: 12
    center: place
    scrollwheel: false
    styles: [ { "featureType": "road", "elementType": "geometry", "stylers": [ { "lightness": 100 }, { "visibility": "simplified" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "visibility": "on" }, { "color": "#C6E2FF" } ] }, { "featureType": "poi", "elementType": "geometry.fill", "stylers": [ { "color": "#C5E3BF" } ] }, { "featureType": "road", "elementType": "geometry.fill", "stylers": [ { "color": "#D1D1B8" } ] } ])
  marker = new (google.maps.Marker)(
    position: place
    map: map
    icon:
      anchor: new google.maps.Point(16, 16),
      path: "M4.415,8.829c2.432,0,4.415-1.983,4.415-4.415 C8.829,1.983,6.846,0,4.415,0S0,1.983,0,4.415C0,6.846,1.983,8.829,4.415,8.829z",
      fillColor: '#2962FF',
      fillOpacity: 1,
      anchor: new google.maps.Point(0,0),
      strokeWeight: 1,
      scale: 2
    )

  return

  map.disableScrollWheelZoom()
