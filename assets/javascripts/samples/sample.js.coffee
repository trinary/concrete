class Sample
  @container = ''

  constructor: (filename) ->
    num = filename.match(/(\d+)/)[0]
    @container = $("<div class='sample' data-filename='#{filename}'>#{num}</div>")
    @toggleTapeOnDoubleClick()

  toggleTapeOnDoubleClick: =>
    @container.dblclick =>
      tape = $('.tape')

      if tape.has(@container).length == 1
        $('.samples').append(@container.toggleClass('on'))
      else
        tape.append(@container.addClass('on'))

      samples.sortSamples()

window.Sample = Sample
