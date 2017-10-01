$(document).ready ->
  slider      = $('#resultsSliderContainer')
  openBtn     = $('.filter-button')
  closeBtn    = $('#closeSliderBtn')

  $.easing.smoothEasing = (x, t, b, c, d) ->
      c * ((t = t / d - 1) * t * t + 1) + b

  openBtn.click ->
    if slider.css('margin-left') == '0px'
      slider.animate 'width': '400px'
    else
      slider.delay(200).animate {
        'margin-left': '+=400'
      },
      duration: 800
      specialEasing: width: 'smoothEasing'

      closeBtn.delay(200).animate {
        'margin-left': '+=400'
      },
      duration: 800
      specialEasing: width: 'smoothEasing'

      slider.addClass('openSlider')


  closeBtn.click ->
    if slider.hasClass('openSlider')
      slider.animate 'margin-left': '-=400px'

      closeBtn.animate 'margin-left': '-=400'

