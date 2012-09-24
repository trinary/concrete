class Sample
  @container = ''

  constructor: (filename) ->
    @container = $("<div class='beat-container' data-filename='#{filename}'></div>")
    @addToTapeOnDoubleClick()

  addToTapeOnDoubleClick: =>
    @container.dblclick =>
      console.log 'dblclick'
      $('.tape').append(@container.addClass('on'))

window.Sample = Sample
