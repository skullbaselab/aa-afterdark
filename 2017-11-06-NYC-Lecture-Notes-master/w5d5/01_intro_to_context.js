// Master the FIVE INVOCATIONS of Javascript!

// #1 Function Style!
function makeDroidTalk(name) {
  return function(thingToSay) {
      console.log(`${name} says: "${thingToSay}"`);
    // return name;
  };
}

// #2 Constructor Style!
function Droid(name, owner) {
  this.name = name;
  this.owner = owner;
  makeDroidTalk(this.name);
}

function Wookie(name) {
  this.name = name;
}

// #3 Method Style!
Droid.prototype.identifySelf = function () {
  console.log(`I am ${this.name}, property of ${this.owner}!!!!`);
};

Droid.prototype.identifySelfTimes = function (num) {
  times(num, this.identifySelf.myBind(this));
};
Wookie.prototype.identifySelf = function () {
  console.log(`${this.name} says: Raaaraaaaraaaaagh!`);
};

Droid.prototype.freakOut = function () {
  console.log(`Oh no, ${this.owner}, we're doomed!`);
};

Droid.prototype.doYouSpeak = function (language) {
  console.log(
    `${this.name} says: Of course! ${language} is like a second langauge to me`
  );
};

Droid.prototype.doYouSpeakTimes = function (num, lang) {
  times(this.doYouSpeak.myBind(this, lang), num);
};


// #4 CALL
// Context (this) is the first argument given
// droid.doYouSpeak.call(wookie, 'Spanish') --> 'this' is the wookie
// #5 APPLY
// Context (this) is the first argument given
// droid.doYouSpeak.call(wookie, 'Spanish') --> 'this' is still the wookie


// CALLBACKS
function times( callback, num = 3) {
  for (let i = 0; i < num; i++) {
    callback();
  }
}


// SOLUTIONS
// Binding is a function called on another function that
// returns a copy of that function with the context fixed.
// Function.prototype.myBind = function (ctx) {
//   const that = this;
//   return function() {
//     that.call(ctx);
//   };
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    // Rest operator (...args) takes an arbitrary amount of args
    // and puts them into an array.
    // Similar to Ruby's splat operator.
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

function force(verb, noun) {
  console.log(`${verb} the ${noun}, ${this.name}.`);
}

// Ex: force.myBind(droid, 'Feel')('force');
// In the above example, 'Feel' comes in with bindArgs,
// 'force' comes in with callArgs
