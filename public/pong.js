(function() {

  this.Pong = (function() {

    function Pong(type) {
      var bounds;
      bounds = new GeometricObject(0, 0, 300, 100);
      this.paddleLeft = new MoveableObject(50, 120, 30, 10, 1, bounds);
      bounds = new GeometricObject(500, 0, 300, 100);
      this.paddleRight = new MoveableObject(500, 120, 30, 10, 1, bounds);
      bounds = new GeometricObject(0, 0, 300, 600);
      this.ball = new MoveableObject(300, 150, 5, 5, 0.3, bounds);
    }

    Pong.prototype.detectPaddleCollision = function() {
      if (this.ball.x <= this.paddleLeft.rightEdge() && this.ball.x >= this.paddleLeft.leftEdge() && this.ball.bottomEdge() >= this.paddleLeft.topEdge() && this.ball.topEdge() <= this.paddleLeft.bottomEdge()) {
        this.ball.x = this.paddleLeft.rightEdge();
        this.ball.reflect();
      }
      if (this.ball.x >= this.paddleRight.leftEdge() && this.ball.x <= this.paddleRight.rightEdge() && this.ball.bottomEdge() >= this.paddleRight.topEdge() && this.ball.topEdge() <= this.paddleRight.bottomEdge()) {
        this.ball.x = this.paddleRight.leftEdge() - this.ball.width;
        return this.ball.reflect();
      }
    };

    Pong.prototype.setGame = function() {
      this.ball.angle = 1;
      this.ball.cleanAngle();
      return this.ball.moveToCenter();
    };

    Pong.prototype.detectGoal = function() {
      if (this.ball.leftEdge() <= this.ball.bounds.leftEdge() || this.ball.rightEdge() >= this.ball.bounds.rightEdge()) {
        return this.setGame();
      }
    };

    Pong.prototype.detectWallCollision = function() {
      if (this.ball.topEdge() <= this.ball.bounds.topEdge()) {
        this.ball.y = this.ball.bounds.topEdge();
        this.ball.deflect();
      }
      if (this.ball.bottomEdge() >= this.ball.bounds.bottomEdge()) {
        this.ball.y = this.ball.bounds.bottomEdge() - this.ball.height;
        return this.ball.deflect();
      }
    };

    Pong.prototype.moveBall = function(delta) {
      return this.ball.move(delta);
    };

    Pong.prototype.tick = function(delta) {
      this.moveBall(delta);
      this.detectPaddleCollision();
      this.detectWallCollision();
      return this.detectGoal();
    };

    return Pong;

  })();

}).call(this);
