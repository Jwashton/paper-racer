drawCircle = (context, x, y, radius, color) ->
  context.fillStyle = color
  context.beginPath()
  context.arc(x, y, radius, 0, Math.PI * 2)
  context.fill()

window.drawStuff = (context) ->
  console.log "drawing"
  
  centerX = window.innerWidth / 2
  centerY = window.innerHeight / 2
  
  context.fillStyle = "#505050"
  context.fillRect(0, 0, window.innerWidth, window.innerHeight)
  
  for x in [-150...151] by 30
    console.log x
    for y in [-150..151] by 30
      drawCircle(context, x + centerX, y + centerY, 3, "#FFFFFF")
