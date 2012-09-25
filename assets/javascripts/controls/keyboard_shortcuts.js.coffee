class KeyboardShortcuts
  constructor: ->
    @clearSelectedBeatsOnSpace()

  clearSelectedBeatsOnSpace: =>
    $(document).keypress (event) =>
      if event.which == 32
        event.preventDefault()
        $('.stop').trigger('click')
        $('.samples').append($('.tape').children('.beat-container').removeClass('on'))
        $('.tape').find('.beat-container').remove()

window.KeyboardShortcuts = KeyboardShortcuts
