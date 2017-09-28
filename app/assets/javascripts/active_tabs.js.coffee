$('#places-kind-filters').ready ->
  $('.filter-button').click ->
    if $('.filter-button').removeClass('active-filter-button')
      $(@).removeClass 'active-filter-button'
    $(@).addClass 'active-filter-button'
    return
