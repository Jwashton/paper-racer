(function() {
  $(function() {
    return $(window).on('mousemove', function(event) {
      window.mouse = [event.clientX, event.clientY];
      return redraw();
    });
  });

}).call(this);
