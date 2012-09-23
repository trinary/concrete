class Controls
  constructor: (concrete)->
    @concrete = concrete
    @createButtons()

  createButtons: =>
    @createPlayButton()
    @createStopButton()

  createPlayButton: =>
    $('body').append('<div class="play">play</div>')
    @playSelectedOnClick()

  createStopButton: =>
    $('body').append('<div class="stop">stop</div>')
    @stopSelectedOnClick()

  playSelectedOnClick: =>
    $('.play').click =>
      elements = $('.on')
      @concrete.playLoop()
      @loopId = setInterval(@concrete.playLoop, (elements.length * @concrete.quarterNoteTime * 1000))

  stopSelectedOnClick: =>
    $('.stop').click =>
      clearInterval(@loopId)

window.Controls = Controls
