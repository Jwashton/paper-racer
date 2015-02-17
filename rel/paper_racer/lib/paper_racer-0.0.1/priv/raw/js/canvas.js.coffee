$ ->
  canvas = document.getElementById('race_view')
  context = canvas.getContext('2d')

  resizeCanvas = ->
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
    window.drawStuff(context)

  window.addEventListener 'resize', resizeCanvas, false
  resizeCanvas()
  window.drawStuff(context)
