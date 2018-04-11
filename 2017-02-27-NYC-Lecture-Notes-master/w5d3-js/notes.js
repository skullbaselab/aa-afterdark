/*
  ###############
  # JS vs. Ruby #
  ###############

  * Stop comparing

  * Code in the browser!!!!!

  * lazyCamelCase

  * ;

  * Falsey values
  * 0
  * undefined
  * ''
  * false
  * null
  * NaN
  * -0

  * == vs. ===
    '0' == 0
    '' == 0
    [] == 0
    [1, 2, 3] == '1,2,3'
    {} == {}

  * Declaring variables
     Beware of globals!

  * Everything is an object! (POJO)
    Well, except primitives...
    strings, numbers, booleans, null, undefined, symbols

  * Functions are your new best friend

  * Seriously, stop comparing!
*/


/*
  ########################
  # VARIABLE DECLATARION #
  ########################
*/

// global variables -> don't use them!
  // password = 'starwars';

// const -> block scoped, cannot be reassigned
// let -> block scoped, can be reassigned
// var -> don't use this anymore, function scoped, can be reassigned
  function scopeDemo() {
     {
      // You can mutate const variables but strings are immutable anyway
      const stubborn = 'I will never change';
      let blockLet = 'Let me be';
      var oldSchool = 'Who is var?';

      // if (true) {
      //   const other = 'hi';
      //   console.log(blockLet);
      // }
      // console.log(other); // -> ReferenceError

      // stubborn = 'Maybe I can change'; // -> TypeError
      blockLet = 'I am not what I used to be'; // -> this works
      oldSchool = 'I am the var'; // -> this also works
    }

    // console.log(stubborn); // -> ReferenceError
    // console.log(blockLet); // -> ReferenceError
    console.log(oldSchool); // -> this works
  }

  // scopeDemo();
  // console.log(stubborn); // -> ReferenceError
  // console.log(blockLet); // -> ReferenceError
  // console.log(oldSchool); // -> ReferenceError

// Hoisting
function hoistingDemo() {
  // var immediately sets the value of hoisted to undefined
  // var hoisted; => another reason to no longer use var (old ES5 syntax)
  // let kinda creates it up here but it's not set to anything so they raise an error
  // let deadZone;

  console.log(hoisted); // -> undefined
  console.log(deadZone); // -> ReferenceError - useful error!
  var hoisted = 'How can I use a variable before I declare it?';
  let deadZone = 'That sounds scary';
}

// hoistingDemo();

/*
  #############
  # FUNCTIONS #
  #############
*/

// FUNCTIONS ARE OBJECTS
  // can be assigned to a variable
  const myFunc = function () {
    return 'I am an object';
  };


  // given arbitrary attributes
  myFunc.isAPotato = false;

  // used as an attribute in a another object
  const funcyObject = {
    someKey: 'someValue',
    funcyKey: myFunc,
  };

  // funcyObject.someKey;
  // funcyObject.funcyKey;
  // // remember to invoke functions with parantheses
  // funcyObject.funcyKey();

  // passed as argument to another function (i.e., as a callback)
  // CALLBACKS ARE ALWAYS INVOKED FUNCTION STYLE.
  function giveMeFunc(callback) {
    return callback();
  }

  giveMeFunc(myFunc);

// FUNCTION DECLARATION
  // named
  const func1 = function named() {
    return 'I am named';
  };

  // anonymous
  const func2 = function () {
    return 'I am anonymous';
  };

  // fat-arrow
  // Can't be named
  const func3 = () => {
    return 'I am young and beautiful';
  };

  // one line fat-arrow
  // implicit return if you leave off the curly braces
  const func4 = () => 'I have implicit return. Take that!';

// ARGUMENTS
  function giveMeTwoArgs(a, b) {
    console.log(`Thanks for ${a} and ${b}`);
  }

  // giveMeTwoArgs(1, 2);
  // giveMeTwoArgs(3, 4, 5, 6);
  // giveMeTwoArgs(); // parentheses required!!!

// WAYS TO CALL A FUNCTION

// always use capital letter for constructor function
  function Dog(fName) {
    this.firstName = fName;
  }

// Do not put instance methods inside of the constructor function
// This is how you make instance methods
  Dog.prototype.eatSticks = function () {
    console.log(`${this.firstName} loves eating sticks`);
  };

  // constructor-style invocation
  // THIS is the new instance of the class
  const ella = new Dog('Ella');

  // method-style invocation
  // THIS is whatever you called the method on
  // ella.eatSticks();

  // function-style invocation
  // THIS will be the global object (window in browser)
  const consumeTwigs = ella.eatSticks;
  // console.log(consumeTwigs === Dog.prototype.eatSticks);
  // consumeTwigs();
    // What happens if we use function style to invoke a constructor? -> Dog()

  // fat-arrow functions and this
  // fat arrow gets THIS from whatever scope it was defined in
  Dog.prototype.eatRocks = () => {
    console.log(`${this.firstName} eats rocks`);
  };

  // ella.eatRocks();

  // What is `this`
    // function-style invocation: the global scope
    // method-style invocation:   whatever it was called on
    // constructor invocation:    new blank object -> the instance being constructed
    // arrow function:            the context in which it was defined

// CALLBACKS
  // NB always invoked function style

  /* In Ruby:  [1, 2, 3, 4, 5].map { |el| el * 2 }
     In JS: */ [1, 2, 3, 4, 5].map(el => el * 2);
    //  same as above

     [1, 2, 3, 4, 5].map(function(el) {
       return el * 2;
     });

  /* In Ruby:
    [1, 2, 3, 4, 5].map do |el|
      if el == 2
        el * 2
      else
        el + 5
      end
    end
  */
  // In JS:
  const myFunc2 = function (el) {
    if (el === 2) {
      return el * 2;
    } else {
      return el + 5;
    }
  };
  // the two things below are the same
  [1, 2, 3].map(myFunc2);
  [1, 2, 3].map(function (el) {
    if (el === 2) {
      return el * 2;
    } else {
      return el + 5;
    }
  });

// CLOSURES

function counter(inc) {
  let count = 0;

  // the function below (a closure) closes over count and inc and has access forever
  // function adding() {
  //   count += inc;
  //   return count;
  // }
  // return adding;

  return (inc) => {
    count += inc;
    return count;
  };
}

function titleize(names, callback) {
  // debugger
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
}

const callbackFunction = (titleizedNames) => {
  // debugger
  titleizedNames.forEach((name) => {
    console.log(name);
  });
};
// invoking the function
titleize(["Mary", "Brian", "Leo"], callbackFunction);


// Homework and Quiz

// https://www.destroyallsoftware.com/talks/wat
