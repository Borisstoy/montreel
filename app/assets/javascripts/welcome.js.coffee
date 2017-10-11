$ ->
  $.easing.smoothEasing = (x, t, b, c, d) ->
      c * ((t = t / d - 1) * t * t + 1) + b

  $('#welcome-btn').on 'click', ->
    $('.layer1').css 'height':'100vh'
    $('.layer2').delay(200).animate {'height':'100vh'}
    $('.layer3').delay(400).animate {'height':'100vh'}

  if (window.location.href.match('/places') != null)

    $(window).bind "load", ->

      $('#welcome-overlay').delay(700).animate {
        'width': '400px'
        },
      duration: 800
      specialEasing: width: 'smoothEasing'

      $('.overlay-container').animate 'width':'300px'

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

