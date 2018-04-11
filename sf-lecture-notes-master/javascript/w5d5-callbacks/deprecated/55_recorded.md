# Week 5 Day 5

### Ways to call a function
- constructor style (using `new`)
  - can use `bind`
    ```js
    var olaf = new Snowman("Olaf")
    ```
- function style
  - not called on an object
  example:
  ```js
  fun();
  // second example
  setTimeout(olaf.melt, 1000);
  setTimeout(olaf.melt.bind(olaf), 1000);
  ```
- method style
  - the object that you're calling the object on
  example:
  ```js
  cat.ageOneYear();
  ```
- `call/apply[]` style
  - you pass as an argument the context that you want it to be bound to

#### Examples
```js
function invokeWithAllArgs(fn) {
  var args = Array.prototype.slice.call(arguments, 1);
  // another shorter way to do the above
  // var args = [].slice.call(arguments, 1);

  return fn.apply(null, arguments);
}

var result = function invokeWithAllArgs(function (a, b, c) {
  console.log('function called');
  console.log('with', a, b, c)

  return a + b + c;
}, 1, 2, 3)

console.log(result);
```

```js
Snowman.prototype.melt = function () {
  console.log(arguments);
  console.log(this.name + " is melting");
};

var olaf = new Snowman("Olaf");

function invokeWithAllArgs(fn) {
  var args = [].slice.call(arguments, 1);
  return fn.apply(args[0], args.slice(1));
}

var result = function invokeWithAllArgs(olaf.melt, olaf, a, b, c);

console.log(result);
```



### Event Loop
  - JS is a single threaded async. (timers, ajax, events)

### Node Modules
- `module.export`
- `require`

Note that `require` and `module.export` only work in node.

```js
// board.js

function Board(x, y) {
  this.grid = [];
  for (var i = 0; i < x; i++) {
    this.grid.push([]);
    for (var j = 0; j < y; j++) {
      this.grid[i].push('x');
    }
  }
}

Board.prototype.display = function () {
  console.log(this.grid)
};


module.export = Board;
```

```js
// game.js

var Board = require('./board.js')

var b = new Board(3, 3);
b.display

// { grid:
//   [ [ 'x', 'x', 'x' ],
//   [ 'x', 'x', 'x' ],
//   [ 'x', 'x', 'x' ] ] }
```

How to use `readline`

```js
var readline = require('readline');

var reader = readline.createInterface(process.stdin, process.stdout, null);

reader.question("What's your fav num?", function (answer) {
  reader.question("What's your fav color?", function (answer) {
    console.log(answer);
    reader.close();
  });
});

```
