class @GeometricObject
  constructor: (@x, @y, @height, @width) ->
    @x = 15 if isNaN(x)
    @y = 15 if isNaN(y)
    @height = 10 if isNaN(height)
    @width = 10 if isNaN(width)
 
  rightEdge: -> @x + @width
  leftEdge: -> @x
  topEdge: -> @y
  bottomEdge: -> @y + @height
  
  centerX: -> @width / 2 + @x
  centerY: -> @height / 2 + @y
