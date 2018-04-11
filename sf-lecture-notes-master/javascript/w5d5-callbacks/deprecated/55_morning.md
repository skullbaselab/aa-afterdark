# W5D5

+ Ways to Call a Function
+ `this` and `that`
+ node modules

---

## Ways to call a function

---

## Ways to call a function
  + function style
  + constructor style
  + method style
  + call/apply[] style

---

## demo time

+ all the styles
+ bind

---

## this and that

* `this` is a special keyword which is never captured and reset on every call.

```javascript
// `times` is the same:
function times(num, fun) {
  for (var i = 0; i < num; i++) {
    fun(); // call is made "function-style"
  }
}

var cat = {
  age: 5,
  ageOneYear: function () {
    this.age += 1;
  }
};

// Function argument is different:
times(10, function () {
  cat.ageOneYear();
});
//or
times(10, cat.ageOneYear.bind(cat));
```

---

## event loop

js is single threaded async. (timers, ajax, events)

---

## node modules

Not supported by the browser by default.

+ module.exports
+ require

---

## Intro to Callbacks: File I/O

* note that all the code runs (to bottom of file) then callbacks are run as 
necesary. i.e. after timers or ajax requests finish

* demo readline

```javascript
var readline = require('readline');
var reader = readline.createInterface(process.stdin, process.stdout, null);
reader.question("What is your name?", function (answer) {
  console.log("Hello " + answer + "!");
});
console.log("Last program line");
```

---

# Projects

* myBind (most missed question in a/A history)
* absurdBubbleSort
    * rather than use < for bubble sort, prompt user for ge
    * write performSortPass recursively

---

## Gotchas

1.  Namespacing and how it works: we should clarify that the purpose is to
avoid writing out long library names (e.g.
Window.Asteroids.MovingObject.prototype.update = ......).  

2.  People had a hard time following what happens with an immediately invoked
function and how the (LongLibraryName || {}) calls the function that we just
wrote.  

3.  People had a hard time understanding what var MovingObject =
Asteroids.MovingObject = function MovingObject(){} does (pointing to the same
spot in memory).

