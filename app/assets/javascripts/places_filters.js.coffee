$ ->
  console.log 'Initializaing places index ajax calls'
  $('.filter-button').on 'click', ->
    place_kind = $(@).attr('data-kind')
    remote_url = $(@).data('remote-url')
    $.ajax
      url: remote_url
      method: 'POST'
      data:
        kind: place_kind
      success:(data) ->
      error:(data) ->
        console.log 'ajax failed: places filter'

  console.log 'Initializaing monuments filter'
  $('span[class*="monuments-filter-btn"], div[class*="monuments-filter-btn"]').on 'click', ->
    monument_cat = $(this).attr('data-monument-cat')
    console.log monument_cat
    $.ajax
      url: 'places/filters'
      method: 'POST'
      data:
        monument_cat: monument_cat
      success: (data) ->
      error: error = {}

  $('.dropdown-btn').on 'click', (e) ->
    e.stopPropagation()
    $('.categories-dropdown').slideDown(300).css 'display', 'flex'

  $('span[class*="monuments-filter-btn"]').on 'click', (e) ->
    e.preventDefault()
    category = $(this).text()
    $('span.dropdown-btn').html category

  $('.places-kind-but-monuments').on 'click', ->
    $('.categories-dropdown').slideUp 300

  ajaxLoader = $('#loading-spinner').hide()
  ajaxLoadTimeout = undefined
  $(document).ajaxStart(->
    ajaxLoadTimeout = setTimeout((->
      ajaxLoader.show()
    ), 400)
  ).ajaxSuccess ->
    clearTimeout ajaxLoadTimeout
    ajaxLoader.hide()



