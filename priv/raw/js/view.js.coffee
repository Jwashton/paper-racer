$ ->
  render = ->
    layers = [
      #"background"
      #"track"
      #"grid"
      #"items"
      #"paths"
      #"racers"
      "chat"
      #"settings"
      #"navigation"
    ]
    
    for layer in layers
      #draw layer
      console.log layer
  
  render()
