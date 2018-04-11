// var justAFunction = function(){
//   console.log("I am the function");
//   console.log(this);
// };
//
// var cat = {
//   name: 'Sarah',
//   sayName: function(){
//     console.log("meow I am " + this.name);
//   }
// }
// justAFunction();
//
// cat.sayName();
//
// var f = cat.sayName;
// f();
//
// f.call(cat);
//
// fBound = f.bind(cat);
// fBound();
//
function Cat(name){
  this.name = name;
};

Cat.prototype.sayName =  function(){
    console.log("meow I am " + this.name);
};

//4 things
// creates a new object, runs Cat with the new object as this
// constructor property set on the prototype of Cat
// sets the __proto__ of the new object to Cat.prototype
// returns the new object automatically

var jeff = new Cat("Jeff");
jeff.sayName();
console.log(jeff.constructor == Cat);


var readline = require('readline');
reader = readline.createInterface({input: process.stdin, output: process.stdout});
// reader.question("Sup: ", function(response){
//   console.log("said: " + response)
//   reader.close();
// });
var Microwave = function(name){
  this.name = name;
};

Microwave.prototype.addStuff = function (stuff) {
  console.log("adding " + stuff);
  this.contents = stuff;
};

Microwave.prototype.removeStuff = function () {
  console.log("removing " + this.contents);
  var stuff = this.contents;
  this.contents = "";
  return stuff;
};

Microwave.prototype.cookForTime = function (seconds, cb) {
  console.log("setting microwave for: " + seconds);
  var that = this;
  setTimeout(function(){
    that.contents = "hot as hell " + that.contents;
    cb();
  }, seconds * 1000);
};

Microwave.prototype.run = function () {
  var that = this;
  reader.question("What are you cooking?", function(food){
    that.addStuff(food);
    reader.question("How many seconds?", function(time){
      that.cookForTime(time, function(){
        that.removeStuff();
        reader.close();
      });
    })
  });
};

var m = new Microwave("Janelle");
m.run();
