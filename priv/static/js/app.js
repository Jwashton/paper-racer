(function() {
  var socket;

  socket = new Phoenix.Socket("ws://" + location.host + "/ws");

  window.connect = function(race_id) {
    var topic;
    topic = "race:" + race_id;
    return socket.join(topic, {}, function(chan) {
      console.log("Joining...");
      chan.on("join", function(message) {
        return console.log(message);
      });
      return chan.on("user:entered", function(message) {
        return console.log("New user: " + message.user);
      });
    });
  };

}).call(this);
