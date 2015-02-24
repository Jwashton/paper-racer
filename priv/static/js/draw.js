(function() {
  var arrayEq, drawChat, drawCircle, within;

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

  window.mouseAt = function() {
    return [Math.round((mouse[0] - window.innerWidth / 2) / 30), Math.round((mouse[1] - window.innerHeight / 2) / 30)];
  };

  within = function(coord, goal, leeway) {
    return coord < goal + leeway && coord > goal - leeway;
  };

  arrayEq = function(left, right) {
    var i, _i, _ref;
    if (!((left != null) && (right != null) && left.length === right.length)) {
      return false;
    } else {
      for (i = _i = 0, _ref = left.length; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (left[i] !== right[i]) {
          return false;
        }
      }
    }
    return true;
  };

  window.drawStuff = function(context) {
    var centerX, centerY, color, racer, simX, simY, x, x2, y, y2, _i, _j, _k, _len;
    centerX = window.innerWidth / 2;
    centerY = window.innerHeight / 2;
    context.fillStyle = "#505050";
    context.fillRect(0, 0, window.innerWidth, window.innerHeight);
    for (x = _i = -150; _i < 151; x = _i += 30) {
      for (y = _j = -150; _j <= 151; y = _j += 30) {
        x2 = x + centerX;
        y2 = y + centerY;
        simX = Math.round(x / 30);
        simY = Math.round(y / 30);
        if (arrayEq(selected, [true, simX, simY])) {
          color = "#40A040";
        } else {
          color = "#DDDDDD";
        }
        if (within(mouse[0], x2, 10) && within(mouse[1], y2, 10)) {
          drawCircle(context, x2, y2, 8, color);
        } else if (arrayEq(selected, [true, simX, simY])) {
          drawCircle(context, x2, y2, 3, color);
        } else {
          drawCircle(context, x2, y2, 3, color);
        }
      }
    }
    for (_k = 0, _len = racers.length; _k < _len; _k++) {
      racer = racers[_k];
      drawCircle(context, racer.x * 30 + centerX, racer.y * 30 + centerY, 5, racer.color);
    }
    return drawChat(context, window.messages);
  };

}).call(this);
