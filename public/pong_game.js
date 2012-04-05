(function() {

  this.PongGame = (function() {

    function PongGame() {
      this.ui = new PongUi();
      this.game = new Pong();
      this.lastExecuted = new Date();
      this.game.setGame();
      setInterval("game.loop()", 1);
    }

    PongGame.prototype.loop = function() {
      var delta, now;
      now = new Date();
      delta = this.lastExecuted - now;
      this.game.tick(delta);
      this.ui.render(this.game);
      return this.lastExecuted = now;
    };

    return PongGame;

  })();

}).call(this);
