(function() {
  $(function() {
    var addRacer, recordMessage, socket;
    socket = new Phoenix.Socket("ws://" + location.host + "/ws");
    window.messages = [];
    window.racers = [];
    window.starting_locations = [[0, 0], [0, 1], [0, 2]];
    window.mouse = [0, 0];
    window.selected = [false, 0, 0];
    window.redraw = function() {
      var context;
      context = $('#race_view')[0].getContext('2d');
      return window.drawStuff(context);
    };
    window.click = function() {
      var _ref;
      window.selected = (_ref = []).concat.apply(_ref, [true, mouseAt()]);
      return recordMessage(mouseAt());
    };
    recordMessage = function(message) {
      window.messages.push(message);
      return redraw();
    };
    addRacer = function(racer) {
      window.racers.push(racer);
      return redraw();
    };
    window.connect = function(race_id, username) {
      var topic;
      topic = "race:" + race_id;
      return socket.join(topic, username, function(chan) {
        console.log("Joining...");
        chan.on("join", function(message) {
          var startSpot;
          recordMessage(message.status);
          console.log(message.status);
          startSpot = starting_locations.pop();
          return addRacer(new Racer(message.user, message.id, startSpot[0], startSpot[1]));
        });
        chan.on("user:entered", function(message) {
          var startSpot;
          recordMessage(JSON.stringify(message.user) + " joined the race");
          startSpot = starting_locations.pop();
          return addRacer(new Racer(message.user, message.id, startSpot[0], startSpot[1]));
        });
        return chan.on("event:begin", function(message) {
          recordMessage("Beginning Race!");
          return recordMessage(JSON.stringify(message.user) + "'s turn");
        });
      });
    };
    return $(window).on('beforeunload', function() {
      return socket.close();
    });
  });

}).call(this);
