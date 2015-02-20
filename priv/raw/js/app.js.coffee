$ ->
  socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  window.messages = []
  window.racers = []

  recordMessage = (message) ->
    window.messages.push message
    context = $('#race_view')[0].getContext('2d')
    window.drawStuff(context)
  
  addRacer = (racer) ->
    window.racers.push racer
  
  window.connect = (race_id, username) ->
    topic = "race:" + race_id
    
    socket.join topic, username, (chan) ->
      console.log("Joining...")
      
      chan.on "join", (message) ->
        recordMessage(message.status)
        console.log(message.status)
      
      chan.on "user:entered", (message) ->
        recordMessage(JSON.stringify(message.user) + " joined the race")
        addRacer(new Racer(message.user, message.id))
        #console.log("New user: " + message.user)
        console.log(message.user)
  
  $(window).on 'beforeunload', ->
    socket.close()
