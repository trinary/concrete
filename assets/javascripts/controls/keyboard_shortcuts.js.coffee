class KeyboardShortcuts
  constructor: ->
    @clearSelectedBeatsOnSpace()

  clearSelectedBeatsOnSpace: =>
    $(document).keypress (event) =>
      if event.which == 32
        event.preventDefault()
        $('.stop').trigger('click')
        $('.tape').find('.beat-container').remove()

window.KeyboardShortcuts = KeyboardShortcuts
