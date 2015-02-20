class @Racer
  constructor: (@name, @id, @x, @y) ->
    @color = '#' + Math.floor(Math.random() * 16777215).toString(16);
