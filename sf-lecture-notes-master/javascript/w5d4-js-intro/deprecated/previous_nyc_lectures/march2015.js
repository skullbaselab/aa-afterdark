// 2 FALSEY RUBY VALUES - false, nil

// 7 FALSEY JS VALUES
//--------------------
// 1. -0
// 2. 0
// 3. NaN
// 4. undefined
// 5. null
// 6. false
// 7. ""

// use triple equals over double equals!
false == 0 // true
false === 0 // false



// FUNCTIONS

var x;

x() // undefined is not a function

x = function (a, b) {
  return a + b;
}; // var x gets hoisted to top, but doesn't get assigned yet

y(1, 2); // 3

function y(a, b) {
  return a + b;
}; // named functions get hoisted to top

x(1, 1);





// ALWAYS USE VAR
"use strict";

constance = 1; // NOOOOOOO // error
var constance = 1; // :)






// ALWAYS USE SEMICOLONS!
var y = 1;

var constance = function (x) {
  return x - 1;
}

(y === 1) ? true : false;

constance //=> ?
//=> constance === false because no semicolon on line 57







if (y === 1) {
  console.log("yay");
}

if (y === 1)
  console.log("yay");

if (y === 1) { console.log("yay"); }

// if, for don't need semicolons
// only expressions




// CLOSURES
var randNumGenerator = (function () {
  var number, returnNum, setRandNum;

  number = 0;

  returnNum = function () {
    return number;
  };

  setRandNum = function () {
    number = Math.random();
    return number;
  };

  return {
    returnNum: returnNum,
    setRandNum: setRandNum
  };
})(); // revealing module pattern

randNumGenerator //=> { returnNum: function, setRandNum: function }
randNumGenerator["returnNum"](); // 0
randNumGenerator.returnNum(); // 0



var a = function () {
  var b = function () {
    var c = function () {
      // can call a and b
    };
  };

  // can call b
  // cannot call c
};



// OBJECTS

var cat = {
  name: "Sennacy",
  age: 7,
  sayHi: function () {
    return "hello! my name is " + this.name;
  }
};

var x = function () {
  return "something else";
};


x();

cat.name; //=> "Sennacy"
cat.sayHi; //=> function
cat.sayHi(); //=> hello! my name is Sennacy

var y = cat.sayHi;

y(); //=> hello! my name is
this.name = "Nathan";
y(); //=> hello! my name is Nathan;





// CONSTRUCTORS
var x = function (a, b) {
  console.log(this);

  this.name = "Sennacy";
  var name = "Sennacy";

  return "constance";
};

x(1, 2); //=> constance

var b = new x(1, 2); //=> { name: "Sennacy" }

// constructor style - new keyword
// 1. makes a new object
// 2. calls function method style on new object
// 3. returns new object - DOES NOT LISTEN TO RETURNS IN THE CONSTRUCTOR






var Cat = function (name, age) {
  this.name = name;
  this.age = age;
};

Cat.COLOR = "orange";

Cat.prototype.sayHi = function () {
  return "hi my name is " + this.name;
};


Array.prototype.myEach = function () {
  this.length;
};


var whatever = Array.prototype.myEach;
whatever();

[].myEach();


var sennacy = new Cat("Sennacy", 7);
//=> { name: "Sennacy", age: 7, sayHi: function }

sennacy.sayHi(); //=> hello my name is Sennacy

Cat("sennacy", 7); // called function style -> this === global object
name //=> "sennacy"





// 3 WAYS TO CALL FUNCTIONS
// 1. function style
// x();
// this === global object
//
// 2. method style
// cat.sayHi();
// this === object called on
//
// 3. constructor style
// new Cat();
// this === new blank object
