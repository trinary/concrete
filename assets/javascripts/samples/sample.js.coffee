class Sample
  @container = ''

  constructor: (filename) ->
    num = filename.match(/(\d+)/)[0]
    @container = $("<div class='sample' data-filename='#{filename}'>#{num}</div>")
    @toggleTapeOnDoubleClick()

  toggleTapeOnDoubleClick: =>
    @container.dblclick =>
      tape = $('.tape')

      if tape.children(@container).length
        $('.samples').append(@container)
      else
        tape.append(@container)

      samples.sortSamples()

window.Sample = Sample
