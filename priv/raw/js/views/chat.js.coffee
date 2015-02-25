class ChatView
  constructor: (@ctx, @messages) ->
    @background_color = "rgba(200, 200, 200, 0.7)" # Slightly transparent Grey
    @text_color       = "rgba(0, 0, 0, 0)"         # Black
    @font             = "12pt serif"
  
  draw: ->
    draw_background()
    draw_messages()
  
  draw_background: ->
    @ctx.fillStyle = @background_color
    @ctx.fillRect(20, window.innerHeight - 170, 200, 150)
  
  draw_messages: ->
    @ctx.fillStyle = @text_color
    @ctx.font      = @font
    
    for i in [0..(@messages.length)]
      y = window.innerHeight - 30 - (i * 20)
      
      if y < window.innerHeight - 150
        break
      
      @ctx.fillText(@messages[i], 30, window.innerHeight - 30 - (i * 20))
