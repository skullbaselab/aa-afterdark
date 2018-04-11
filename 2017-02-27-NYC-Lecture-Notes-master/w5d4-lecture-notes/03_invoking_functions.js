// Calling functions

function Human(moniker) {
  this.moniker = moniker;
}

Human.prototype.eat = function (food) {
  //this is whatever method is called upon
  console.log(`${this.moniker} eats the ${food}.`);
};

Human.prototype.vogue = function () {
  console.log(`${this.moniker} strikes a pose.`);
};

Human.prototype.times = function(callback, numTimes) {
  for (let i = 0; i < numTimes; i++) {
    callback(); //function style
    //A callback will always be invoked function style
    //when called function style, this will
  }
};
//constructor style
const finn = new Human('Finn');

//method style
finn.times(finn.vogue, 3);
//method style also
finn.eat('bacon pancakes');
