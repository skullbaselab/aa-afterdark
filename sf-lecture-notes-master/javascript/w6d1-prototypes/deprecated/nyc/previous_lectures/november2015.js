// W6D1

var add = function(a, b) {
  return a + b;
};

//naive solution
var addToTen = function(b) {
  return 10 + b;
};

//better way
var betterAddToTen = add.bind(this, 10);

betterAddToTen(4); //=> 14

//curried version
var curriedAdd = function(a) {
  return function(b) {
    return a + b;
  }
};

var curriedAddToTen = curriedAdd(10);

curriedAddToTen(4); // => 14

var curriedAddThreeNums = function(a) {
  var secondCurry = function(b) {
    var thirdCurry = function(c) {
      return a + b + c;
    }

    return thirdCurry;
  }

  return secondCurry;
};

var addThreeNums = function(a, b, c) {
  return a + b + c;
};


var curriedAddThreeNums = function (a) {
   return function (b) {
     return function (c) {
       return a + b + c;
    };
  };
};




// arguments

var add = function(a, b) {
  debugger
  console.log(arguments, "arguments");
  return a + b;
};

// Array-like object
var obj = {
  0: "a",
  1: "b",
  2: "c",
  length: 3
}

// possible Array.slice() implementation
Array.prototype.slice = function() {
  var newArray = [];

  for (var i = 0; i < this.length; i++) {
    newArray.push(this[i]);
  }

  return newArray;
};



// prototyp(ic)al inheritence

var Animal = function(color) {
  this.color = color;
  this.mood = "happy";
};

Animal.prototype.breathe = function() {
  return "inhale, exhale";
}

// using `new` sets the __proto__ property to Animal.prototype
// cannot set __proto__ manually
var a = new Animal("blue");

var Cat = function(name) {
  this.name = name;
};

Cat.prototype.meow = function() {
  return "meow";
}

// naive inheritence
// BAD - we lost the Cat.prototype methods
Cat.prototype = Animal.prototype


// changing the order gives the Cat all the methods
// But, BAD - gives the Animal all the Cat methods too
Cat.prototype = Animal.prototype

Cat.prototype.meow = function() {
  return "meow";
}



// need to instantiate an object to set the prototype
// forces us to instantiate an unneccessary Animal instance and properties
Cat.prototype = new Animal("green");

Cat.prototype.meow = function() {
  return "meow";
}


// better solution
var Animal = function(color) {
  this.color = color;
  this.mood = "happy";
};

Animal.prototype.breathe = function() {
  return "inhale, exhale";
}

var Cat = function(color, name) {
  // this.color = color;
  // this.mood = "happy";
  Animal.call(this, color);

  this.name = name;
};

// Surrogate is a blank object with a pointer to the Animal.prototype
var Surrogate = function() {};
Surrogate.prototype = Animal.prototype;
Cat.prototype = new Surrogate();

// can be abstracted to something like this
// Cat.inherits(Animal);

// fancy way:
// Cat.prototype = Object.create(Animal.prototype);

// adding methods to the Surrogate prototype
Cat.prototype.meow = function() {
  return "meow";
}

c = new Cat("orange", "Sennacy");




// Namespacing

// everything is namespaced under window.Asteroids
window.Asteroids = {};

window.Asteroids.MovingObject = function() {

};

window.Asteroids.MovingObject.prototype.move = function() {};

new window.Asteroids.MovingObject();


//wrapping everything in a function gives us private scope
// must invoke it to take effect
(function() {
  // this var declaration is local to this IIFE
  var Asteroids = window.Asteroids = {};

  var MovingObject = Asteroids.MovingObject = function() {};

  MovingObject.prototype.move = function() {};
})();







(function() {
  // this wipes out the window.Asteroids from the previous IIFE
  var Asteroids = window.Asteroids = {};

  var Spaceship = Asteroids.Spaceship = function() {};

  Spaceship.prototype.move = function() {};
})();






(function() {
  // safe way
  var Asteroids = window.Asteroids = window.Asteroids || {};

  // more specific way
  if (typeof window.Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Spaceship = Asteroids.Spaceship = function() {};

  Spaceship.prototype.move = function() {};
})();


var spaceship = new window.Asteroids.Spaceship();


// allows non-browser implementation
(function(root) {
  // safe way
  var Asteroids = root.Asteroids = root.Asteroids || {};

  // more specific way
  if (typeof root.Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Spaceship = Asteroids.Spaceship = function() {};

  Spaceship.prototype.move = function() {};
})(this);




//
