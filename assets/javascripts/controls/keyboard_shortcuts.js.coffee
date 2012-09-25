class KeyboardShortcuts
  constructor: ->
    @clearSelectedBeatsOnX()
    @togglePlayingOnSpace()

  togglePlayingOnSpace: =>
    $(document).keypress (event) =>
      if event.which = 32
        event.preventDefault()
        concrete.togglePlay()


  clearSelectedBeatsOnX: =>
    $(document).keypress (event) =>
      if event.which == 120
        event.preventDefault()
        concrete.clearSamples()

window.KeyboardShortcuts = KeyboardShortcuts
