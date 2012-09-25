class Samples
  @container = ''

  constructor: ->
    @container = $('<div class="samples" />')
    @attachContainerToBody()

  attachContainerToBody: =>
    $('body').append(@container)

  sortSamples: =>
    @container.children('.sample')


$ ->
  window.samples = new Samples
