(function() {
  var ChatView;

  ChatView = (function() {
    function ChatView(_at_ctx, _at_messages) {
      this.ctx = _at_ctx;
      this.messages = _at_messages;
      this.background_color = "rgba(200, 200, 200, 0.7)";
      this.text_color = "rgba(0, 0, 0, 0)";
      this.font = "12pt serif";
    }

    ChatView.prototype.draw = function() {
      draw_background();
      return draw_messages();
    };

    ChatView.prototype.draw_background = function() {
      this.ctx.fillStyle = this.background_color;
      return this.ctx.fillRect(20, window.innerHeight - 170, 200, 150);
    };

    ChatView.prototype.draw_messages = function() {
      var i, y, _i, _ref, _results;
      this.ctx.fillStyle = this.text_color;
      this.ctx.font = this.font;
      _results = [];
      for (i = _i = 0, _ref = this.messages.length; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        y = window.innerHeight - 30 - (i * 20);
        if (y < window.innerHeight - 150) {
          break;
        }
        _results.push(this.ctx.fillText(this.messages[i], 30, window.innerHeight - 30 - (i * 20)));
      }
      return _results;
    };

    return ChatView;

  })();

}).call(this);
