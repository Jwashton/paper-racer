require.config
  baseUrl: 'js/'
  paths:
    jquery: 'jquery-min'
  map:
    '*':
      'jquery': 'jquery-private'
    'jquery-private':
      'jquery': 'jquery'

require ['jquery'], ($) ->
  socket = new Phoenix.Socket('ws://' + location.host + '/ws')
  data_store =
    messages: []
    racers:   []
    starting_locations: [[0, 0], [0, 1], [0, 2]]
    mouse:    [0, 0]
    selected: [false, 0, 0]
  
  console.log data_store.selected
