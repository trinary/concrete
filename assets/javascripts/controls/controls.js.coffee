class Controls
  constructor: ->
    @createButtons()

  createButtons: =>
    @createPlayButton()
    @createStopButton()
    @createSortButton()

  createPlayButton: =>
    $('body').append('<div class="play">play</div>')
    @playSelectedOnClick()

  createStopButton: =>
    $('body').append('<div class="stop">stop</div>')
    @stopSelectedOnClick()

  createSortButton: =>
    $('body').append('<div class="sort">sort clips</div>')
    @sortOnClick()

  sortOnClick: =>
    $('.sort').click =>
      samples.sortSamples()

  playSelectedOnClick: =>
    $('.play').click => concrete.play()

  stopSelectedOnClick: =>
    $('.stop').click => concrete.stop()

window.Controls = Controls
