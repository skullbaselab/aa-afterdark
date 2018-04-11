// ***JAVASCRIPT***

// 🍞 the coolest language ever
// adds a layer of interactivity to HTML/CSS

// DIFFERENCES BETWEEN JS AND RUBY

  // not everything is an object in JS:
    // instead we have primitives and objects
    // primitives include: strings, numbers, booleans, null, undefined, symbols

  // JS has more falsey values:
    // JS: 0, -0, '', NaN, null, undefined, false
    // Ruby: nil, false

  // In JS, `==` performs type coercion DON'T USE IT

  // Variables are declared differently

  // In most cases, JS does not have implicit return
  // (single-line fat-arrow functions are the exception)

  // In JS we use camelCase (as opposed to Ruby's snake_case)

// VARIABLE DECLARATION

  // If we try to declare a variable without one of the following keywords,
  // the variable will be declared in the global namespace. We don't want to do this.

  // `let` - block-scoped { i am a block :) }

  if (true) {
    let thing = 'stuff';
  }
  console.log(thing);

  // `const`
    // - block-scoped, does not allow re-assignment USE THIS UNLESS YOU NEED TO RE-ASSIGN

  // `var` - var is old school, function-scoped 👵🏻

// HOISTING
  let favFood = 'Taco';
  if (true) {
    // console.log(favFood);
    let favFood = 'Pizza';
    console.log(favFood);
  }
  console.log(favFood);

// FUNCTION DECLARATION
  // named function
  function name(arg) {
    // does stuff
  }

  // anonymous
  function () {
    console.log('hello');
  }

  // fat-arrow
  () => {
    console.log('the coolest function declaration');
  }

// `THIS`

  // `this` in function-style invocation: the global scope
  // `this` in a method-style invocation: whatever it was called on
  // `this` in constructor invocation: this instance being constructed
  // `this` in arrow functions: the context in which it was defined

// WAYS TO CALL A FUNCTION
  function Elephant(name) {
    this.name = name;
  }

  // function-style invocation
  name('whatever');

  // constructor-style invocation
  const wally = new Elephant('Wallace');

  // method-style invocation
  wally.trumpet();


// CLOSURES AND CALLBACKS

  // callbacks are always invoked function-style

  // closures can capture variables defined in the scope they were defined in
