class Tape
  constructor: ->
    @container = $('<div class="tape" />')
    @attachContainerToBody()

  attachContainerToBody: =>
    $('body').append(@container)

window.Tape = Tape
