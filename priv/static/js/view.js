(function() {
  $(function() {
    var render;
    render = function() {
      var layer, layers, _i, _len, _results;
      layers = ["chat"];
      _results = [];
      for (_i = 0, _len = layers.length; _i < _len; _i++) {
        layer = layers[_i];
        _results.push(console.log(layer));
      }
      return _results;
    };
    return render();
  });

}).call(this);
