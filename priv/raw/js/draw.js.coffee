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

window.mouseAt = () ->
  [Math.round((mouse[0] - window.innerWidth / 2) / 30),
   Math.round((mouse[1] - window.innerHeight / 2) / 30)]

within = (coord, goal, leeway) ->
  coord < goal + leeway and coord > goal - leeway

arrayEq = (left, right) ->
  unless left? and right? and left.length == right.length
    return false
  else
    for i in [0..(left.length)]
      return false if left[i] != right[i]
  true
    

window.drawStuff = (context) ->
  centerX = window.innerWidth / 2
  centerY = window.innerHeight / 2
  
  context.fillStyle = "#505050"
  context.fillRect(0, 0, window.innerWidth, window.innerHeight)
  
  for x in [-150...151] by 30
    for y in [-150..151] by 30
      x2 = x + centerX
      y2 = y + centerY
      
      simX = Math.round(x / 30)
      simY = Math.round(y / 30)
      
      if arrayEq(selected, [true, simX, simY])
        color = "#40A040"
      else
        color = "#DDDDDD"
      
      if within(mouse[0], x2, 10) and within(mouse[1], y2, 10)
        drawCircle(context, x2, y2, 8, color)
      else if arrayEq(selected, [true, simX, simY])
        drawCircle(context, x2, y2, 3, color)
      else
        drawCircle(context, x2, y2, 3, color)
  
  for racer in racers
    drawCircle(context, racer.x * 30 + centerX, racer.y * 30 + centerY, 5, racer.color)
  
  drawChat(context, window.messages)
  
