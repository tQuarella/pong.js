class @Pong
  constructor: (type)->
     @paddleLeft = new MoveableObject
     @paddleLeft.x = 0
     @paddleLeft.y = 0
     @paddleRight = new MoveableObject
     @paddleRight.x = 100
     @paddleRight.y = 100
     @ball = new MoveableObject

  startGame: ->
    @ball.angle = Math.floor(Math.random() * 90) - 45
    @ball.cleanAngle()

  setGame: ->
    @ball.moveToCenter()

  detectPaddleCollision: ->
    #this assumes the ball has not magically teleported through the paddle
    if @ball.x <= @paddleLeft.rightEdge() && @ball.x >= @paddleLeft.leftEdge() &&
    @ball.bottomEdge() >= @paddleLeft.topEdge() && @ball.topEdge() <= @paddleLeft.bottomEdge()
      #collision with left paddle
      @ball.reflect()

    if @ball.x >= @paddleRight.leftEdge() && @ball.x <= @paddleRight.rightEdge() &&
    @ball.bottomEdge() >= @paddleRight.topEdge() && @ball.topEdge() <= @paddleRight.bottomEdge()
      #collision with right paddle
      @ball.reflect()

  detectGoal: ->
    if @ball.leftEdge() == @ball.bounds.leftEdge() || @ball.rightEdge() == @ball.bounds.rightEdge()
      @setGame()

  detectWallCollision: ->
    if @ball.topEdge() == @ball.bounds.topEdge() || @ball.bottomEdge() == @ball.bounds.bottomEdge()
      @ball.deflect()

  moveBall: (delta) -> @ball.move()
