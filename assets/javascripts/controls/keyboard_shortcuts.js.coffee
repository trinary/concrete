class KeyboardShortcuts
  constructor: ->
    @clearSelectedBeatsOnSpace()

  clearSelectedBeatsOnSpace: =>
    $(document).keypress (event) =>
      if event.which == 32
        event.preventDefault()
        $('.on').each (i, element) =>
          $(element).removeClass('on')


window.KeyboardShortcuts = KeyboardShortcuts
