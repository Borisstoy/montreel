$ ->
  $('.filter-button').on 'click', ->
    place_kind = $(@).attr('data-id')
    remote_url = $(@).data('remote-url')
    console.log remote_url
    $.ajax
      url: remote_url
      method: 'POST'
      data: kind: place_kind
      console.log place_kind
      success:(data) ->
      error:(data) ->
        return false
