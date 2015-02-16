socket = new Phoenix.Socket("ws://" + location.host + "/ws")

window.connect = (race_id) ->
  topic = "race:" + race_id
  
  socket.join topic, {}, (chan) ->
    console.log("Joining...")
    
    chan.on "join", (message) ->
      console.log(message)
    
    chan.on "user:entered", (message) ->
      console.log("New user: " + message.user)
