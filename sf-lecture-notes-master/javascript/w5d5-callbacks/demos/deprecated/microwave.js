var reader = require('readline').createInterface(process.stdin, process.stdout, null);

var Microwave = function(){};

Microwave.prototype.addFood = function (stuff) {
  console.log("adding " + stuff);

  this.contents = stuff;
};

Microwave.prototype.removeFood = function () {
  console.log("removing " + this.contents);

  var contents = this.contents;
  this.contents = "";
  return contents;
};

Microwave.prototype.cookForTime = function (seconds, functionToRunWhenFinished) {
  console.log("setting microwave for: " + seconds);

  var microwave = this;

  setTimeout(function(){
    microwave.contents = "hot as hell " + microwave.contents;
    functionToRunWhenFinished();

  }, seconds * 1000);
};


Microwave.prototype.run = function () {
  var microwave = this;

  var handleWhatWereCooking = function(food){
    microwave.addFood(food);

    reader.question("How many seconds?\n", function(seconds){

      microwave.cookForTime(seconds, function(){
        microwave.removeFood();
        reader.close();
      });

    })
  }

  reader.question("What are you cooking?\n", handleWhatWereCooking);
};


var spankingNewMicrowave = new Microwave();
spankingNewMicrowave.run();
