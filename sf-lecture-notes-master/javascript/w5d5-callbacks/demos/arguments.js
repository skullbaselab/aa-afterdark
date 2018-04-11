// fewer arguments & default values

const foo = (arg1, arg2, arg3 = "third") => {
  console.log(`arg1 is: ${arg1}`);
  console.log(`arg2 is: ${arg2}`);
  console.log(`arg3 is: ${arg3}`);
};

foo("first", "second");
foo("first", "second", "fourth");
foo();



// Array.prototype.print = function() {
  
// }
// Array.prototype.print2 = () => {
  
// }
// a = new Array()
// a.print2


function test(arg1, ...args) {
  console.log('arg1', arg1);
  console.log('args', args);
  console.log('es5args', arguments);
  console.log('es5ArgsArray', Array.prototype.slice.call(arguments));
}













/* ----------------------------------- */

// Extra Arguments
function bar(arg1, arg2) {
  console.log(`The type of 'arguments' is: ${arguments.constructor.name}`);

  // ES-5
  const sliced = Array.prototype.slice.call(arguments);
  console.log(`slice'd type is: ${sliced.constructor.name}`);

  // ES-6 --> prefer this syntax
  const fromd = Array.from(arguments);
  console.log(`from'd type is: ${fromd.constructor.name}`);
};

bar("winnie", "gage", "robert", "claire");


/* ----------------------------------- */

// Rest Parameters

const far = (arg1, arg2, ...otherArgs) => {
  console.log(`arg1 is: ${arg1}`);
  console.log(`arg2 is: ${arg2}`);

  console.log(`otherArgs is: ${otherArgs}`);
  console.log(`otherArgs type is: ${otherArgs.constructor.name}`);
};

far("kevin", "shamayel", "munyo", "jeff");







/* ----------------------------------- */

// Spread Parameters

const boo = (arg1, arg2, arg3) => {
  console.log(`Javascript is ${arg1}, ${arg2}, & ${arg3}!!!`);
};

boo("amazing", "wonderful", "intuitive")
const adjectives = ["amazing", "wonderful", "intuitive"];
boo(adjectives);
boo(...adjectives);





