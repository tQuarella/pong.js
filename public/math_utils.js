(function() {

  this.radsToDegs = function(rads) {
    return rads * (180 / Math.PI);
  };

  this.degsToRads = function(degs) {
    return degs * (Math.PI / 180);
  };

}).call(this);
