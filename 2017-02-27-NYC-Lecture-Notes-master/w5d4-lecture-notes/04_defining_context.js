function Alligator(moniker) {
  this.moniker = moniker;
}

Alligator.prototype.chomp = function() {
  console.log(`${this.moniker} chomps viciously`);
};

// Alligator.prototype.chomp.bind(allison)();

function Owl(moniker) {
  this.moniker = moniker;
}

Owl.prototype.hoot = function(adverb) {
  debugger
  console.log(`${this.moniker} hoots ${adverb}`);
};

Owl.prototype.sayHello = function(adverb) {
  debugger
  // const that = this; //historical, but confusing
  // const thisOwl = this; //Way #1: store this in var and user var in callback
  // Way #2: use bind on callback
  times(() => {
    debugger
    this.hoot(adverb);
  }, 3);
};

function times(callback, numTimes) {
  debugger
  for (let i = 0; i < numTimes; i++) {
    callback();
  }
}

// Set up some instances
const hootie = new Owl('Hootie');
const allison = new Alligator('Allison');

const detachedHoot = hootie.hoot;

// Call
// detachedHoot.call(hootie, "sonorously");
// Arguments are passed separated by commas

// Apply
// detachedHoot.apply(allison, ["sonorously"]);
// Arguments are passed in as an array.
// Convenient when number of arguments is unknown

// Bind
// returns new bound function
const boundHoot = detachedHoot.bind(hootie, "sonorously");

// times(hootie.hoot, 4); //won't work
// times(function () {
//   hootie.hoot("cautiously");
// }, 4); //this works!
// times(hootie.hoot.bind(hootie, "loudly"), 6); //this works too
