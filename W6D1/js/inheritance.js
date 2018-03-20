Function.prototype.inherits = function(Parent) {
  function Surrogate() {}

  Surrogate.prototype = Parent.prototype;
  const surrogate = new Surrogate();
  this.prototype = surrogate;
  this.prototype.constructor = this;

};


//
// Function.prototype.inherits = function(Parent) {
//   this.prototype = Object.create(Parent.prototype);
//   this.prototype.constructor = this;
// };


function MovingObject () {}

MovingObject.prototype.fly = function() {
  console.log("I'm flying");
};

function Ship () {}
Ship.inherits(MovingObject);
Ship.prototype.sail = function() {
  console.log("sailing");
};

function Asteroid () {}
Asteroid.inherits(Ship);


let ship = new Ship();
ship.fly();
let asteroid = new Asteroid();
asteroid.fly();
