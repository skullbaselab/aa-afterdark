const timer = require('timers');

class Cat {
  constructor (name) {
    this.name = name;
  }

  purr (adv, too) {
    // debugger
    console.log(`${this.name} purrs ${adv} and ${too}`);
  }

}

class Scientist {
  constructor (name) {
    this.name = name;
  }

  beScientist () {
    console.log(`${this.name} is being a scientist`);
  }

  doExperiment (experiment) {
    experiment();
  }

  beScientistLater () {
    // the context inside fat arrow functions, is the context outside fat arrow functions
    // we don't need to bind fat arrows because of what's said in line 30
    // If you try to bind a fat arrow nothing will happen
    timer.setTimeout(() => this.beScientist(), 1000);

    // opening this anonymous function opens a new scope where this will be wrong
    // UNLESS we bind it to this on the outside, which is our beloved scientist
    // timer.setTimeout(function() {
    //   this.beScientist();
    // }.bind(this), 1000);


    // const beScientist = this.beScientist;
    // timer.setTimeout(beScientist.bind(this), 100);


    //tis confusing
    // let that = this;
    // timer.setTimeout(function() {
    //   that.beScientist();
    // }, 1000);
  }
}

const meag = new Scientist('meagan');
const chloe = new Cat('chloe');

// bind sets the context for a function and returns that function
const functionThatWillMakeMeagPurr = chloe.purr.bind(meag);
// functionThatWillMakeMeagPurr("poorly");
// bind
// bind to other

// bind to preserve this
chloe.purr();

// call actually invokes the function with the new context
chloe.purr.call(meag, "like a champ", "potential second argument");

const hey = function() {
  console.log(`Hey ${this.name}`);
};

// hey.bind(chloe)();
// meag.beScientistLater(meag);

// apply

chloe.purr.apply(meag, ["like a champ", "also"]);
chloe.purr.call(meag, ...["like a champ", "also"]);
