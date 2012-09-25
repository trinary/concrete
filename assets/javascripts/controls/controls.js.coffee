class Controls
  constructor: (concrete)->
    @concrete = concrete
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
    $('.play').click =>
      elements = $('.on')

      if elements.length > 0
        @concrete.playLoop()
        @loopId = setInterval(@concrete.playLoop, (elements.length * @concrete.quarterNoteTime * 1000))

  stopSelectedOnClick: =>
    $('.stop').click =>
      clearInterval(@loopId)

window.Controls = Controls
