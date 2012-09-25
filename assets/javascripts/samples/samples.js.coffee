class Samples
  @container = ''

  constructor: ->
    @container = $('<div class="samples" />')
    @attachContainerToBody()

  attachContainerToBody: =>
    $('body').append(@container)

  sortSamples: =>
    samples = @container.children('.sample')
    sampleCount = samples.length

    for i in [sampleCount-2..0]
      sample1 = @container.find("[data-filename=\"beat_#{i}.mp3\"]")
      sample2 = @container.find("[data-filename=\"beat_#{i+1}.mp3\"]")
      sample1.prependTo(sample2.parent())

$ ->
  window.samples = new Samples
