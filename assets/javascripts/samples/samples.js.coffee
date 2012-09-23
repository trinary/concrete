class Samples
  @container = ''

  constructor: ->
    @container = $('<div class="samples" />')
    @attachContainerToBody()

  attachContainerToBody: =>
    $('body').append(@container)

$ ->
  window.samples = new Samples
