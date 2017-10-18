$ ->
  $.easing.smoothEasing = (x, t, b, c, d) ->
      c * ((t = t / d - 1) * t * t + 1) + b
  ajaxLoader = $('#loading-spinner').fadeIn(800)

  $('#welcome-btn').on 'click', ->

    $('.layer1').animate {'height':'100%'}
    $('.layer2').delay(200).animate {'height':'100%'}
    $('.layer3').delay(400).animate {'height':'100%'}

    $('.logo-welcome').fadeOut(8000)

    ajaxLoader.show().fadeOut(9000)

  if (window.location.href.match('/places') != null)

    $(window).bind "load", ->
      $('.logo-welcome').fadeOut(8000)
      $('#white-overlay').animate {'margin-left':'-1000px'}
      $('.logo-welcome').hide()
      $('.overlay-container').animate { 'margin-left':'0'}


      $('#welcome-overlay').delay(600)
                           .animate {'width': '400px'}

      $('.overlay-container').animate 'width':'300px'

      $('#welcome-btn').delay(1900).animate {
        'margin-left': '-800'
      },
      duration: 800
      specialEasing: width: 'smoothEasing'

      $('.places-index-intro').delay(1500).animate {
        'margin-left': '0'
      },
      duration: 400
      specialEasing: width: 'smoothEasing'

      $('#close-welcome-btn').delay(1500).animate {
        'margin-left': '0'
      },
      duration: 400
      specialEasing: width: 'smoothEasing'


      $('#close-welcome-btn').on 'click', ->
        $('#welcome-overlay').delay(200).animate {
          'margin-left': '-800'
        },
        duration: 800
        specialEasing: width: 'smoothEasing'

        $('#welcome-overlay').removeClass 'transitioned-1s'

$ ->
  $('.alert').fadeOut(10000)
