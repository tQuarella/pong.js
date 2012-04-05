(function() {

  this.PongUi = (function() {

    function PongUi() {}

    PongUi.prototype.render = function(game) {
      $("body").html("");
      this.renderGeometricObject(game.ball.bounds, "black");
      this.renderGeometricObject(game.paddleLeft, "blue");
      this.renderGeometricObject(game.paddleRight, "blue");
      return this.renderGeometricObject(game.ball, "red");
    };

    PongUi.prototype.renderGeometricObject = function(geometricObject, color) {
      var div;
      div = $("<div/>").css("height", geometricObject.height).css("width", geometricObject.width).css("border", "1px solid " + color).css("position", "absolute").css("margin-top", geometricObject.y).css("margin-left", geometricObject.x);
      return $("body").append(div);
    };

    return PongUi;

  })();

}).call(this);
