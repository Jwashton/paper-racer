(function() {
  $(function() {
    $(window).on('mousemove', function(event) {
      window.mouse = [event.clientX, event.clientY];
      return redraw();
    });
    return $(window).on('click', function(event) {
      click();
      return redraw();
    });
  });

}).call(this);
