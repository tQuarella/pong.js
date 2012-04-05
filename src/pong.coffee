class @Pong
  constructor: (type)->
     bounds = new GeometricObject(0,0,300,100)
     @paddleLeft = new MoveableObject(50,120,30,10,1,bounds)
     bounds = new GeometricObject(500,0,300,100)
     @paddleRight = new MoveableObject(500,120,30,10,1,bounds)
     bounds = new GeometricObject(0,0,300,600)
     @ball = new MoveableObject(300,150,5,5,0.3,bounds)

  detectPaddleCollision: ->
    #this assumes the ball has not magically teleported through the paddle
    if @ball.x <= @paddleLeft.rightEdge() && @ball.x >= @paddleLeft.leftEdge() &&
    @ball.bottomEdge() >= @paddleLeft.topEdge() && @ball.topEdge() <= @paddleLeft.bottomEdge()
      #collision with left paddle
      @ball.x = @paddleLeft.rightEdge()
      @ball.reflect()

    if @ball.x >= @paddleRight.leftEdge() && @ball.x <= @paddleRight.rightEdge() &&
    @ball.bottomEdge() >= @paddleRight.topEdge() && @ball.topEdge() <= @paddleRight.bottomEdge()
      #collision with right paddle
      @ball.x = @paddleRight.leftEdge() - @ball.width
      @ball.reflect()
  
  setGame: ->
    #@ball.angle = Math.floor(Math.random() * 90) - 45
    @ball.angle = 1
    @ball.cleanAngle()
    @ball.moveToCenter()

  detectGoal: ->
    if @ball.leftEdge() <= @ball.bounds.leftEdge() || @ball.rightEdge() >= @ball.bounds.rightEdge()
      @setGame()

  detectWallCollision: ->
    if @ball.topEdge() <= @ball.bounds.topEdge()
      @ball.y = @ball.bounds.topEdge()
      @ball.deflect()
    if @ball.bottomEdge() >= @ball.bounds.bottomEdge()
      @ball.y = @ball.bounds.bottomEdge() - @ball.height
      @ball.deflect()
  moveBall: (delta) -> @ball.move(delta)

  tick: (delta) ->
    @moveBall(delta)
    @detectPaddleCollision()
    @detectWallCollision()
    @detectGoal()
