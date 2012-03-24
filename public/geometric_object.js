(function() {

  this.GeometricObject = (function() {

    function GeometricObject(x, y, height, width) {
      this.x = x;
      this.y = y;
      this.height = height;
      this.width = width;
      if (isNaN(x)) this.x = 15;
      if (isNaN(y)) this.y = 15;
      if (isNaN(height)) this.height = 10;
      if (isNaN(width)) this.width = 10;
    }

    GeometricObject.prototype.rightEdge = function() {
      return this.x + this.width;
    };

    GeometricObject.prototype.leftEdge = function() {
      return this.x;
    };

    GeometricObject.prototype.topEdge = function() {
      return this.y;
    };

    GeometricObject.prototype.bottomEdge = function() {
      return this.y + this.height;
    };

    GeometricObject.prototype.centerX = function() {
      return this.width / 2 + this.x;
    };

    GeometricObject.prototype.centerY = function() {
      return this.height / 2 + this.y;
    };

    return GeometricObject;

  })();

}).call(this);
