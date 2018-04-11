function Cat() {

}

function Animal() {

}


function inherits(child, parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
  child.prototype.constructor = child;
}

for (let i = 0; i < array.length; i = i + 1) {
  const el = array[i]
  // const is block scoped, so no fear of reassigning
}


const arr = [1, 2];
arr.push(3);
// you can mutate constants, just can't reassign

function compare(a, b) {
  return b - a;
}
