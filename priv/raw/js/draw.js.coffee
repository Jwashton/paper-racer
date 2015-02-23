drawCircle = (context, x, y, radius, color) ->
  context.fillStyle = color
  context.beginPath()
  context.arc(x, y, radius, 0, Math.PI * 2)
  context.fill()

drawChat = (context, messages) ->
  context.fillStyle = "rgba(200, 200, 200, 0.7)"
  context.fillRect(20, window.innerHeight - 170, 200, 150)
  
  context.fillStyle = "#000000"
  context.font = "12pt serif"
  i = 0
  for message in messages.slice().reverse()
    y = window.innerHeight - 30 - (i * 20)
    if y < window.innerHeight - 150
      break
    context.fillText(message, 30, window.innerHeight - 30 - (i * 20))
    i++

within = (x, goal, leeway) ->
  x < goal + leeway and x > goal - leeway

window.drawStuff = (context) ->
  centerX = window.innerWidth / 2
  centerY = window.innerHeight / 2
  
  context.fillStyle = "#505050"
  context.fillRect(0, 0, window.innerWidth, window.innerHeight)
  
  for x in [-150...151] by 30
    for y in [-150..151] by 30
      x2 = x + centerX
      y2 = y + centerY
      
      if within(mouse[0], x2, 10) and within(mouse[1], y2, 10)
        drawCircle(context, x + centerX, y + centerY, 8, "#DDDDDD")
      else
        drawCircle(context, x + centerX, y + centerY, 3, "#FFFFFF")
  
  for racer in racers
    drawCircle(context, racer.x * 30 + centerX, racer.y * 30 + centerY, 5, racer.color)
  
  drawChat(context, window.messages)
  
