(function() {
  $(function() {
    var canvas, context, resizeCanvas;
    canvas = document.getElementById('race_view');
    context = canvas.getContext('2d');
    resizeCanvas = function() {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
      return window.drawStuff(context);
    };
    window.addEventListener('resize', resizeCanvas, false);
    resizeCanvas();
    return window.drawStuff(context);
  });

}).call(this);
