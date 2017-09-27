$ ->
  $('.filter-button').on 'click', ->
    place_kind = $(@).attr('id')
    $.ajax
      url: '/places/filters'
      method: 'POST'
      data: kind: place_kind
      console.log place_kind
      success:(data) ->
      error:(data) ->
        return false
