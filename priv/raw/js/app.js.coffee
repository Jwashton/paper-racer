require.config
  baseUrl: 'js/',
  paths:
    jquery: 'jquery-min'
  map:
    '*': { 'jquery': 'jquery-private' }
    'jquery-private': { 'jquery': 'jquery' }
  urlArgs: "bust=" + (new Date()).getTime()

require ['jquery'], ($) ->
  socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  
  data_store =
    messages: []
    racers: []
    starting_locations: [[0, 0], [0, 1], [0, 2]]
    mouse: [0, 0]
    selected: [false, 0, 0]
  
  console.log data_store
    
#  window.redraw = ->
#    context = $('#race_view')[0].getContext('2d')
#    window.drawStuff(context)
#  
#  window.click = ->
#    window.selected = [].concat([true, mouseAt()]...)
#    recordMessage(mouseAt())
#  
#  recordMessage = (message) ->
#    window.messages.push message
#    redraw()
#  
#  addRacer = (racer) ->
#    window.racers.push racer
#    redraw()
#  
#  window.connect = (race_id, username) ->
#    topic = "race:" + race_id
#    
#    socket.join topic, username, (chan) ->
#      console.log("Joining...")
#      
#      chan.on "join", (message) ->
#        recordMessage(message.status)
#        console.log(message.status)
#        startSpot = starting_locations.pop()
#        addRacer(new Racer(message.user, message.id, startSpot[0], startSpot[1]))
#      
#      chan.on "user:entered", (message) ->
#        recordMessage(JSON.stringify(message.user) + " joined the race")
#        startSpot = starting_locations.pop()
#        addRacer(new Racer(message.user, message.id, startSpot[0], startSpot[1]))
#      
#      chan.on "event:begin", (message) ->
#        recordMessage("Beginning Race!")
#        recordMessage(JSON.stringify(message.user) + "'s turn")
#  
#  $(window).on 'beforeunload', ->
#    socket.close()
