class Concrete
  constructor: ->
    @samplesContainer = samples.container
    @audioUrl = 'audio'
    @beatUrl = ''
    @controls = new window.Controls(@)
    @tape = new window.Tape

    # TODO: make BPM user controlled
    @BPM = 100
    @context = new window.webkitAudioContext()
    @quarterNoteTime = (60/@BPM)

    @sounds = {}
    
    @fetchSounds()

  fetchSounds: =>
    $.getJSON @audioUrl, (data) =>
      @beatHref = data.beats_href
      for d in data.items
        @fetchSound(d)

  fetchSound: (filename) =>
    request = new XMLHttpRequest()
    request.open('GET', @beatHref + filename, true)
    request.responseType = 'arraybuffer'

    request.onload = =>
      @context.decodeAudioData(
        request.response,
        (buffer) =>
          @sounds[filename] = buffer

          beatContainer = new window.Sample(filename).container
          @samplesContainer.append beatContainer
          @attachBeatContainerEventHandler(beatContainer)
        )
    request.send()

  attachBeatContainerEventHandler: (container) =>
    container.click (event)=>
      event.preventDefault()
      container.toggleClass('on')

      if container.hasClass('on')
        @playFile container.data('filename')

      setTimeout =>
        container.toggleClass('on')
      , @quarterNoteTime*1000

  playFile: (filename, noteDelay = 0) =>
    source = @context.createBufferSource()
    javascriptNode = @context.createJavaScriptNode(2048)

    source.buffer = @sounds[filename]
    source.connect(@context.destination)
    javascriptNode.connect(@context.destination)

    source.noteOn(noteDelay)

    $('.stop').click =>
      source.noteOff(0)

  play: =>
    elements = $('.on')

    if elements.length > 0
      @playLoop()
      @loopId = setInterval(@playLoop, (elements.length * @quarterNoteTime * 1000))

  stop: =>
    clearInterval(@loopId)

  togglePlay: =>
    if @loopId
      @stop()
    else
      @play()

  clearSamples: =>
    @stop()
    $('.samples').append($('.tape').children('.sample').removeClass('on'))
    $('.tape').find('.sample').remove()
    samples.sortSamples()


  playLoop: =>
    startTime = @context.currentTime
    @playSelectedClips(startTime)
    
  playSelectedClips: (startTime) =>
    elements = $('.on')
    i = 0
    while i < elements.length
      element = elements[i]
      time = startTime + i * @quarterNoteTime

      @playFile($(element).data('filename'), time, true)
      i += 1

$ ->
  window.concrete = new Concrete
  keyboardShortcuts = new KeyboardShortcuts
