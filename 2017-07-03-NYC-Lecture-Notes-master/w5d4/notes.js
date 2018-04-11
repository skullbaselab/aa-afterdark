// ***JAVASCRIPT***

// DIFFERENCES BETWEEN JS AND RUBY
    // 1) STYLE - SEMI-COLONS!!!!
    //     ; at the end of expressions - in most cases they are optional
    //     however use of ; is standard style for most JS
    //     the linters on aA computers will yell at you if you don't use them
    //    Q: What even is a linter?
    //    A: Scans your code and highlights syntax/style errors.

    // 2) NAMING CONVENTION
    //    naming convention - Ruby was snake case: def method_name
    //                        JS is camel case:    function methodName
              //  for classes/object constructors: function ClassName
    //
    // 3) SPACES WITHIN CURLY BRACES
      //  for readability!
      // function someFunc() { return true; }
      // function someOtherFunc() {return true;}

    // 4) FALSEY VALUES IN JS:
    //     a) 0
    //     b) ''
    //     c) NaN
    //     d) false
    //     e) null
    //     f) undefined
    //     g) -0   (lol yup)

    // 5) DATA TYPES IN JS:
    //    primitive data types: (all immutable)
    //      a) Number (can't call methods on numbers in JS!)
    //      b) Boolean
    //      c) String ( can call methods, but that doesn't mutate the original string)
    //      d) null, undefined            //
    //    data types with methods (objects):
    //      Objects
    //      Arrays (objects where the keys are indices, values are the elements)
    //      Functions ( yup all functions are objects in JS! )

// VARIABLE DECLARATION
    // 3 ways to declare variables:

    //   const  - sets variable in block scope, cannot be reassigned
    //   let    - sets variable in block scope, you CAN reassign
    //   var    - sets variable in function scope, CAN reassign

    //   by default use const - we don't want to unexpectedly reassign a variable
    //      also lets reader of the code know this is variable that doesn't get reassigned
    //   switch to let if and only if you HAVE to reassign

    //  you can reassign a let or var that has been declared but
    //  you cannot re-declare a let or var in the same block

// FUNCTIONS
//  are objects!

      // NAMED FUNCTION
      function quickFunc() {
        console.log("quickFunc");
      }

      //       ANONYMOUS FUNCTION
      const otherFunc = function (variable) {
        console.log(variable);
      };

            //    ANONYMOUS ARROW FUNCTION
            //  maintains the context of where it was defined
      const arrowFunc = () => {
        console.log('newish sleek ES6 arrow func');
      };

          //      CONSTRUCTOR FUNCTION - invoked with 'new'
      function Dog(name) {
        // 'this' is a special keyword, describes context in which we are in
        this.name = name;
      }

        // context will be the dog this function is called on
        // 'this' is the dog instance
      Dog.prototype.hello = function (first, second, third) {
        console.log(`Hello, this is ${this.name}`);
        console.log(`${first}, ${second}, ${third}`);
      };

        // context is brought in with the arrow function so in this case
        // 'this' ends up being the global object (Window in Chrome)
      Dog.prototype.badhello = () => {
        console.log(this);
        console.log(`Hello, this is ${this.name}`);
      };

      Dog.prototype.doTrick = function (trick) {
        console.log(`I can't do ${trick}`);
      };

      // FUNCTIONS invoked 'function-style' (not called on an object) will have
      // the global object as their context - ie, 'this' will point to the global


// HOISTING
  // variable DECLARATIONS are hoisted (run at the top of the scope)
  // variable DEFINITIONS are NOT

  // let favFood = 'Taco';
  // if (true) {
  //   // console.log(favFood);
  //   let favFood = 'Pizza';
  //   console.log(favFood);
  // }
  // console.log(favFood);

// CLOSURES AND CALLBACKS
      // Callbacks: functions passed in as an argument to another function!
      // in JS - functions require an EXPLICIT return

    const array = [1, 2, 3];
    array.map((el) => {
      return el * 2;
    });

    // single line arrow functions have implicit return (ES6 addition)
    // but in general EXPLICIT returns are clearer
    //
    const callback = (el) => el * 2;
    array.map(callback);


    // CLOSURES:
    //
    // this function returns another function!  a function that does this is
    // called a 'higher-order function'

    // this returned function still has access to variables in the scope
    // where it was originally defined, so its a 'closure'

function dinerBreakfast() {
  const foods = ["cheesy scrambled eggs"];
  // the functioned returned by dinerBreakfast can use this foods variable
  // even though its not inside its definition.

  // returned function definition:
  return (newFood) => {
    if (newFood) {
      foods.push(`and ${newFood}`);
      return `I'd like ${foods.join(" ")} please.`;
    }
    return `I'd like ${foods} please.`;
  };
}
