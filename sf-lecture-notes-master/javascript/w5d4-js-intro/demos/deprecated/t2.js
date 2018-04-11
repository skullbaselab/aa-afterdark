// var expressLove = function(thing){
//   console.log("I love " + thing);
// };
//
// var expressHate = function(thing){
//   console.log("I hate " + thing);
// };
var actions = {
  expressLove: function(thing){
    console.log("I love " + thing);
  },
  expressHate: function(thing){
    console.log("I hate " + thing);
  }
};

var doForBoth = function(action, item1, item2){
  action(item1);
  action(item2);
};

doForBoth(actions['expressLove'], "Sarah", "Cherry Garcia");
doForBoth(actions['expressHate'], "Sunburns", "Fillings");
