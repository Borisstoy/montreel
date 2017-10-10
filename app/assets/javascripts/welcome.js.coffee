if (window.location.href.match('/places') != null)
  $.easing.smoothEasing = (x, t, b, c, d) ->
      c * ((t = t / d - 1) * t * t + 1) + b

  $(window).bind "load", ->
    $('#welcome-overlay').animate 'width': '400px'
    $('.overlay-container').animate 'width':'300px'
    $('#black-overlay').delay(400).animate {
      'margin-top': '-2000px'
    },
    duration: 1800
    specialEasing: width: 'smoothEasing'

    $('#welcome-btn').delay(1500).animate {
      'margin-left': '-800'
    },
    duration: 800
    specialEasing: width: 'smoothEasing'

    $('.places-index-intro').delay(1000).animate {
      'margin-left': '0'
    },
    duration: 800
    specialEasing: width: 'smoothEasing'

    $('#close-welcome-btn').delay(1000).animate {
      'margin-left': '0'
    },
    duration: 800
    specialEasing: width: 'smoothEasing'


    $('#close-welcome-btn').on 'click', ->
      $('#welcome-overlay').delay(200).animate {
        'margin-left': '-800'
      },
      duration: 800
      specialEasing: width: 'smoothEasing'

