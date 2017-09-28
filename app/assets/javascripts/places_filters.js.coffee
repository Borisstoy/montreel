$ ->
  console.log 'Initializaing places index ajax calls'
  $('.filter-button').on 'click', ->
    place_kind = $(@).attr('data-id')
    remote_url = $(@).data('remote-url')
    $.ajax
      url: remote_url
      method: 'POST'
      data: kind: place_kind
      console.log place_kind
      success:(data) ->
      error:(data) ->
        return false
