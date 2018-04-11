const chant = function() {
  const store = [];
  return function (word) {
    store.push(word);
    for (let i = 0; i < store.length; i++) {
      console.log(`${store[i]}!`);
    }
  };
};

let hChants = chant();
hChants("hooray");
hChants("holla");

// const someObj = {
//   one: 1,
//   1: 'one',
//   someFunc: function(params) {
//     console.log(params);
//   }
// };

// function Foo() {};

// Foo.someProp = 5;
// Foo.someProp;
// Foo.prototype.someProp = 6;
// const a = new Foo();
// a.someProp; // return 6

// someObj.someFunc();
