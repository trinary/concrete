class Sample
  @container = ''
  constructor: (filename) ->
    @container = $("<div class='beat-container' data-filename='#{filename}'></div>")


window.Sample = Sample
