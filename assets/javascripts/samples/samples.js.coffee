class Samples
  @container = ''

  constructor: ->
    @container = $('<div class="samples" />')
    @attachContainerToBody()

  attachContainerToBody: =>
    $('body').append(@container)

  sortSamples: =>
    sampleContainers = []
    @container.children('.sample').each (i, element) =>
      console.log 'hey'
$ ->
  window.samples = new Samples
