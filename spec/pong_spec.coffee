describe "Pong: ", ->
  it "initializes with pong pre-sets", ->
    w = new Pong
    expect(w.paddleLeft).toBeDefined()
    expect(w.paddleRight).toBeDefined()
    expect(w.ball).toBeDefined()

  it "sets the game", ->
    w = new Pong
    spyOn(w.ball, "moveToCenter")
    w.setGame()
    expect(w.ball.moveToCenter).toHaveBeenCalled()

  it "changes ball direction when colliding with left paddle", ->
    w = new Pong
    w.ball.angle = 180
    w.ball.x = w.paddleLeft.rightEdge() - (w.paddleLeft.width / 2)
    w.ball.y = w.paddleLeft.topEdge() - (w.paddleLeft.height/ 2)
    w.detectPaddleCollision()
    expect(w.ball.angle).toEqual 0

  it "does not change ball direction when the ball does not collide with the left paddle", ->
    w = new Pong
    w.ball.angle = 180
    w.ball.x = w.paddleLeft.rightEdge()
    w.ball.y = w.paddleLeft.bottomEdge() + 1
    w.detectPaddleCollision()
    expect(w.ball.angle).toEqual 180

  it "changes ball direction when colliding with right paddle", ->
    w = new Pong
    w.ball.angle = 0
    w.ball.x = w.paddleRight.leftEdge() + (w.paddleRight.width / 2)
    w.ball.y = w.paddleRight.topEdge() + (w.paddleRight.height/ 2)
    w.detectPaddleCollision()
    expect(w.ball.angle).toEqual 180

  it "does not change ball direction when the ball does not collide with the right paddle", ->
    w = new Pong
    w.ball.angle = 0
    w.ball.x = w.paddleRight.leftEdge()
    w.ball.y = w.paddleRight.bottomEdge() + 1
    w.detectPaddleCollision()
    expect(w.ball.angle).toEqual 0

  it "resets the game when the ball hits the left edge", ->
    w = new Pong
    w.ball.x = w.ball.bounds.leftEdge()
    spyOn(w, "setGame")
    w.detectGoal()
    expect(w.setGame).toHaveBeenCalled()
    
  it "resets the game when the ball hits the right edge", ->
    w = new Pong
    w.ball.x = w.ball.bounds.rightEdge() - w.ball.width
    spyOn(w, "setGame")
    w.detectGoal()
    expect(w.setGame).toHaveBeenCalled()

  it "inverts balls angle when it collides with the top edge of its bounds", ->
    w = new Pong
    w.ball.angle = 30
    w.ball.y = w.ball.bounds.topEdge()
    w.detectWallCollision()
    expect(w.ball.angle).toEqual(300)
    
  it "inverts balls angle when it collides with the bottom edge of its bounds", ->
    w = new Pong
    w.ball.angle = 300
    w.ball.y = w.ball.bounds.bottomEdge() - w.ball.height
    w.detectWallCollision()
    expect(w.ball.angle).toEqual(30)
