// JavaScript notes


// JavaScript: whYyY?




// Falsey values

const falseyValues = [ NaN, 0, "", undefined, -0, null, false /* can u name them all? */ ];



// Explicit return

function square(x) {
  return x * x;
}



// Testing for equality
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness

'' === 0;
[1, 2, 3] === '1,2,3';
// {} === {} returns false



// camelCase

const noMoreSnek = '🚫🐍';



// Semicolons (use them)



// Arguments

function doNotArgueWithMe() {
  console.log('It will not make a difference');
}

function helloStranger(stranger) {
  console.log(`Hello, ${stranger}`);
}



// Functions as first-class citizens

function two() { return 2; }
function four() { return 4; }

two() + four();

function car() { console.log('🚗'); }
car.model = 'Honda Civic';



// Variables

const numbers = [4, 8, 15, 16, 23, 42];

let address = '598 Broadway';
address = '159 W 25th St';


let favFood = "Taco";
if (true) {
  console.log(favFood);
  favFood = "Pizza";
  console.log(favFood);
}
console.log(favFood);



// Anonymous function declaration

const helloWorld = function() {
  console.log('Hello World');
};

const holaMundo = () => {
  console.log('Hola Mundo');
};



// `this` in different function invocations

// function-style, this is global/window.
helloWorld();
// constructor-style, this is the object you are creating
function Cat(name) {
  this.name = name;
}
// method-style, this is the object the function was called on
  Cat.prototype.hello = function () {
    console.log(`${this.name} says hello`);
  };
  const cat = new Cat("Orpheus");
  cat.hello();


// Closures - function that captures in-scope variables

function counter(inc) {
  let count = 0;

  return function() {
    count += inc;
    console.log(`Invoked ${count} time(s)`);
  };
}



// Callbacks - function that can be passed to another function as an argument

function funcInvoker(func) {
  func();
}

// https://www.destroyallsoftware.com/talks/wat
