Array.prototype.myEach = function(eachcb) {
  for (let i = 0; i < this.length; i++) {
    eachcb(this[i]);
  }
};

Array.prototype.myMap = function(mapcb) {
  const newArr = [];

  this.myEach(function(whatevs) {
    return newArr.push(mapcb(whatevs));
  });
};

function doThing() {
  // Do some stuff
}

// Essentially saying:

const doThings = function() {
  // Do some stuff
};
