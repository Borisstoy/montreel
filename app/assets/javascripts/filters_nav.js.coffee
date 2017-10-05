$('#places-kind-filters').ready ->
  $('.filter-button').click ->
    if $('.filter-button').removeClass('active-filter-button')
      $(@).removeClass 'active-filter-button'
    $(@).addClass 'active-filter-button'

$('#places-kind-filters').easeScroll({
  frameRate: 60,
  animationTime: 1100,
  stepSize: 120,
  pulseAlgorithm: 1,
  pulseScale: 8,
  pulseNormalize: 1,
  accelerationDelta: 20,
  accelerationMax: 1,
  keyboardSupport: true,
  arrowScroll: 50,
  touchpadSupport: true,
  fixedBackground: true
})

$('#resultsSliderContainer').scroll ->
  if $(@).scrollTop() > 0
    $('#results-header').addClass('sticky-results-header')
  else if $(@).scrollTop() == 0
    $('#results-header').removeClass('sticky-results-header')


