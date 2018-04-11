// ES5 CLASSES
function Droid(name, owner) {
  this.name = name;
  this.owner = owner;
}
Droid.prototype.identifySelf = function () {
  console.log(`I am ${this.name}, property of ${this.owner}!!!!`);
};

Droid.prototype.identifySelfTimes = function (num) {
  times(num, this.identifySelf.myBind(this));
};
    // vs.
// ES6 CLASSES
class Droid {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  identifySelf() {

  }

  identifySelfTimes() {

  }
}
