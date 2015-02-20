(function() {
  $(function() {
    var addRacer, recordMessage, socket;
    socket = new Phoenix.Socket("ws://" + location.host + "/ws");
    window.messages = [];
    window.racers = [];
    recordMessage = function(message) {
      var context;
      window.messages.push(message);
      context = $('#race_view')[0].getContext('2d');
      return window.drawStuff(context);
    };
    addRacer = function(racer) {
      return window.racers.push(racer);
    };
    window.connect = function(race_id, username) {
      var topic;
      topic = "race:" + race_id;
      return socket.join(topic, username, function(chan) {
        console.log("Joining...");
        chan.on("join", function(message) {
          recordMessage(message.status);
          return console.log(message.status);
        });
        return chan.on("user:entered", function(message) {
          recordMessage(JSON.stringify(message.user) + " joined the race");
          addRacer(new Racer(message.user, message.id));
          return console.log(message.user);
        });
      });
    };
    return $(window).on('beforeunload', function() {
      return socket.close();
    });
  });

}).call(this);
