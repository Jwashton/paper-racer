$ ->
  $(window).on 'mousemove', (event) ->
    window.mouse = [event.clientX, event.clientY]
    redraw()
  
  $(window).on 'click', (event) ->
    click()
    redraw()
