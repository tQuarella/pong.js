class @PongGame
  constructor: ->
    @ui = new PongUi()
    @game = new Pong()
    @lastExecuted = new Date()
    @game.setGame() 
    setInterval("game.loop()", 1)

  loop: ->
    now = new Date()
    delta = @lastExecuted - now
    @game.tick(delta)
    @ui.render(@game)
    @lastExecuted = now
