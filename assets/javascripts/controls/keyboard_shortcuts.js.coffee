class KeyboardShortcuts
  constructor: ->
    @clearSelectedBeatsOnSpace()

  clearSelectedBeatsOnSpace: =>
    $(document).keypress (event) =>
      if event.which == 32
        event.preventDefault()
        $('.stop').trigger('click')
        $('.samples').append($('.tape').children('.sample').removeClass('on'))
        $('.tape').find('.sample').remove()

window.KeyboardShortcuts = KeyboardShortcuts
