(function() {
  this.Racer = (function() {
    function Racer(_at_name, _at_id, _at_x, _at_y) {
      this.name = _at_name;
      this.id = _at_id;
      this.x = _at_x;
      this.y = _at_y;
      this.color = '#' + Math.floor(Math.random() * 16777215).toString(16);
    }

    return Racer;

  })();

}).call(this);
