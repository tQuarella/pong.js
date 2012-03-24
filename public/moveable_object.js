(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  this.MoveableObject = (function(_super) {

    __extends(MoveableObject, _super);

    function MoveableObject(x, y, height, width, speed, bounds) {
      this.height = height;
      this.width = width;
      this.speed = speed;
      this.bounds = bounds;
      if (!height) this.height = 2;
      if (!width) this.width = 1;
      this.x = x || 0;
      this.y = y || 0;
      if (!bounds) this.bounds = new GeometricObject(15, 15, 10, 10);
      if (!speed) this.speed = 1;
      this.angle = 0;
    }

    MoveableObject.prototype.move = function(delta) {
      var distance, x, y;
      distance = delta * this.speed;
      y = distance * Math.sin(degsToRads(this.angle));
      x = distance * Math.sin(degsToRads(90 - this.angle));
      this.x += parseFloat(x.toFixed(2));
      this.y += parseFloat(y.toFixed(2));
      if (this.rightEdge() > this.bounds.rightEdge()) {
        this.x = this.bounds.rightEdge() - this.width;
      }
      if (this.bottomEdge() > this.bounds.bottomEdge()) {
        return this.y = this.bounds.bottomEdge() - this.height;
      }
    };

    MoveableObject.prototype.moveToCenter = function() {
      this.x = this.bounds.centerX() - (this.width / 2);
      return this.y = this.bounds.centerY() - (this.height / 2);
    };

    MoveableObject.prototype.reflect = function() {
      this.angle -= 180;
      return this.cleanAngle();
    };

    MoveableObject.prototype.deflect = function() {
      if (this.angle < 90 || (this.angle > 180 && this.angle < 270)) {
        this.angle -= 90;
      } else {
        this.angle += 90;
      }
      return this.cleanAngle();
    };

    MoveableObject.prototype.cleanAngle = function() {
      if (this.angle < 0) this.angle += 360;
      if (this.angle > 360) return this.angle -= 360;
    };

    return MoveableObject;

  })(GeometricObject);

}).call(this);
