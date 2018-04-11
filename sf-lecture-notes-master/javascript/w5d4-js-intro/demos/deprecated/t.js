function quicksort(ary) {
    if (ary.length < 2) {
        return ary;
    }
    var pivot = ary[0];
    var rest = ary.splice(1, ary.length - 1);
    var left = [];
    var right = [];
    var forEachCallback = function(num, index){
        if (num < pivot) {
            right.push(num);
        } else {
            right.push(num);
        }
    }
    jeffEachWithIndex(rest, forEachCallback);
    return quicksort(left).concat([pivot]).concat(quicksort(right));
};


function jeffEachWithIndex(ary, callBack){
  for(var i = 0; i < ary.length; i++){
    callBack(ary[i], i);
  }
}

console.log(quicksort([6,3,8,5,6,2]));

function Cat(name){
  this.name = name;
}

Cat.jump = function(){
  console.log('jump');
}

Cat.prototype.meow = function(){
  console.log('lol');
}

Cat.prototype.beNice = function(){
  console.log("Hi, I'm " + this.name);
}
