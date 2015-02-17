(function() {
  var drawChat, drawCircle;

  drawCircle = function(context, x, y, radius, color) {
    context.fillStyle = color;
    context.beginPath();
    context.arc(x, y, radius, 0, Math.PI * 2);
    return context.fill();
  };

  drawChat = function(context, messages) {
    var i, message, y, _i, _len, _ref, _results;
    context.fillStyle = "rgba(200, 200, 200, 0.7)";
    context.fillRect(20, window.innerHeight - 170, 200, 150);
    context.fillStyle = "#000000";
    context.font = "12pt serif";
    i = 0;
    _ref = messages.slice().reverse();
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      message = _ref[_i];
      y = window.innerHeight - 30 - (i * 20);
      if (y < window.innerHeight - 150) {
        break;
      }
      context.fillText(message, 30, window.innerHeight - 30 - (i * 20));
      _results.push(i++);
    }
    return _results;
  };

  window.drawStuff = function(context) {
    var centerX, centerY, x, y, _i, _j;
    centerX = window.innerWidth / 2;
    centerY = window.innerHeight / 2;
    context.fillStyle = "#505050";
    context.fillRect(0, 0, window.innerWidth, window.innerHeight);
    for (x = _i = -150; _i < 151; x = _i += 30) {
      for (y = _j = -150; _j <= 151; y = _j += 30) {
        drawCircle(context, x + centerX, y + centerY, 3, "#FFFFFF");
      }
    }
    return drawChat(context, window.messages);
  };

}).call(this);
