class Sample
  @container = ''

  constructor: (filename) ->
    num = filename.match(/(\d+)/)[0]
    @container = $("<div class='sample' data-filename='#{filename}'>#{num}</div>")
    @addToTapeOnDoubleClick()

  addToTapeOnDoubleClick: =>
    @container.dblclick =>
      console.log 'dblclick'
      $('.tape').append(@container.addClass('on'))

window.Sample = Sample
