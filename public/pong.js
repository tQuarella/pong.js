(function() {

  this.Pong = (function() {

    function Pong(type) {
      this.paddleLeft = new MoveableObject;
      this.paddleLeft.x = 0;
      this.paddleLeft.y = 0;
      this.paddleRight = new MoveableObject;
      this.paddleRight.x = 100;
      this.paddleRight.y = 100;
      this.ball = new MoveableObject;
    }

    Pong.prototype.startGame = function() {
      this.ball.angle = Math.floor(Math.random() * 90) - 45;
      return this.ball.cleanAngle();
    };

    Pong.prototype.setGame = function() {
      return this.ball.moveToCenter();
    };

    Pong.prototype.detectPaddleCollision = function() {
      if (this.ball.x <= this.paddleLeft.rightEdge() && this.ball.x >= this.paddleLeft.leftEdge() && this.ball.bottomEdge() >= this.paddleLeft.topEdge() && this.ball.topEdge() <= this.paddleLeft.bottomEdge()) {
        this.ball.reflect();
      }
      if (this.ball.x >= this.paddleRight.leftEdge() && this.ball.x <= this.paddleRight.rightEdge() && this.ball.bottomEdge() >= this.paddleRight.topEdge() && this.ball.topEdge() <= this.paddleRight.bottomEdge()) {
        return this.ball.reflect();
      }
    };

    Pong.prototype.detectGoal = function() {
      if (this.ball.leftEdge() === this.ball.bounds.leftEdge() || this.ball.rightEdge() === this.ball.bounds.rightEdge()) {
        return this.setGame();
      }
    };

    Pong.prototype.detectWallCollision = function() {
      if (this.ball.topEdge() === this.ball.bounds.topEdge() || this.ball.bottomEdge() === this.ball.bounds.bottomEdge()) {
        return this.ball.deflect();
      }
    };

    Pong.prototype.moveBall = function(delta) {
      return this.ball.move();
    };

    return Pong;

  })();

}).call(this);
