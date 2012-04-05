class @MoveableObject extends GeometricObject
  constructor: (x,y, @height, @width, @speed, @bounds) ->
    @height = 2 if !height
    @width =  1 if !width
    @x = x || 0
    @y = y || 0
    @bounds = new GeometricObject(15,15,10,10) if !bounds
    @speed =  1 if !speed
    @angle = 0

  move: (delta) ->
    distance = delta * @speed
    y = distance * Math.sin(degsToRads(@angle))
    x = distance * Math.sin(degsToRads(90 - @angle))
    @x += parseFloat(x.toFixed(2))
    @y += parseFloat(y.toFixed(2))
    if @rightEdge() > @bounds.rightEdge()
      @x = @bounds.rightEdge() - @width
    if @bottomEdge() > @bounds.bottomEdge()
      @y = @bounds.bottomEdge() - @height

  moveToCenter: ->
    @x = @bounds.centerX() - (@width/2)
    @y = @bounds.centerY() - (@height/2)


  #deflect and reflect currently assume the object is in a box
  reflect: ->
    if @angle > 0 && @angle < 90 || @angle > 180 && @angle < 270
      @angle += 90
    else if @angle > 90 && @angle < 180 || @angle > 270 && @angle < 360
      @angle -= 90
    else if @angle == 0 || @angle == 180
      @angle += 180
    @cleanAngle()

  # we're not handling the 90 or 270 cases because they should never happen in pong
  deflect: ->
    if @angle < 90 || (@angle > 180 && @angle < 270)
      @angle -= 90
    else
      @angle += 90
    @cleanAngle()

  cleanAngle: ->
    @angle += 360 if @angle < 0
    @angle -= 360 if @angle > 360
