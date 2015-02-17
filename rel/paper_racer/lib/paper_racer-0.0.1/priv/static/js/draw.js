(function() {
  var drawCircle;

  drawCircle = function(context, x, y, radius, color) {
    context.fillStyle = color;
    context.beginPath();
    context.arc(x, y, radius, 0, Math.PI * 2);
    return context.fill();
  };

  window.drawStuff = function(context) {
    var centerX, centerY, x, y, _i, _results;
    console.log("drawing");
    centerX = window.innerWidth / 2;
    centerY = window.innerHeight / 2;
    context.fillStyle = "#505050";
    context.fillRect(0, 0, window.innerWidth, window.innerHeight);
    _results = [];
    for (x = _i = -150; _i < 151; x = _i += 30) {
      console.log(x);
      _results.push((function() {
        var _j, _results1;
        _results1 = [];
        for (y = _j = -150; _j <= 151; y = _j += 30) {
          _results1.push(drawCircle(context, x + centerX, y + centerY, 3, "#FFFFFF"));
        }
        return _results1;
      })());
    }
    return _results;
  };

}).call(this);
