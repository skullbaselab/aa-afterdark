## Topics
### Arguments
* JS doesn't care how many args you actually pass in, omitted params will be
  undefined
* `arguments`, an array LIKE object (can index, but not use `Array.prototype`
  methods
* common to array-ify by using `Array.prototype.slice.call(arguments)`
* has `length` and `[]`
* `arguments` not really an array, but can use `Array.prototype.slice.call(arguments)`
* allows us to have splat like behavior

### Prototypal Inheritance
* `.__proto__` points to an object's prototype, the thing it inherits from, when
  an object doesn't have own property, it looks up the inheritance chain
* `a = {}`, `a`'s [[Prototype]], read using `__proto__` is Object.prototype
* since `a` was created using the `Object` constructor, its [[Prototype]] is
  `Object.prototype`.
* all functions have a `.prototype` pointing to a empty object
* if you call a function as a constructor it: creates a new empty object and
  sets `this` to the new object. Sets the object's [[Prototype]] to the
  constructor function's `.prototype` object. Sets the `constructor` property
  to the constructor function.
* `Object.create(protoToBe)`, creates a new object and sets its [[Prototype]] to
  whatever was passed in as an argument. Can be used for building inheritance.

* MOST IMPORTANT to emphasize the `__proto__` chain and how it's built,
  constructor functions set new objects `__proto__` to their `.prototype`
  object.

* Hand Made Inheritance

```javascript
function BaseConstructor(name){ this.name = name; }

function ChildConstructor(name, age){ BaseConstructor.call(this, name); }

function Surrogate(){};
Surrogate.prototype = BaseConstructor.prototype;
ChildConstructor.prototype = new Surrogate();
ChildConstructor.prototype.constructor = ChildConstructor;
//also, ChildConstructor.prototype = Object.create(BaseConstructor.prototype);
//this does exactly the same thing but is not supported by IE8

c = new Child("Sarah", 25);
// c --> (ChildConstructor.prototype, the new surrogate) -->
BaseConstructor.prototype --> Object.prototype
```

### Client Side JS
* no `module.exports`, `<script src="./my_file.js"></script>` loaded into global
  namespace, like ruby!
* `require` is not needed (or supported) in browser
* Ruby, `module` exists for grouping classes and methods, JS doesn't have but we
  can recreate some of the functionality to prevent collisions.
* Wrap everything in an anonymous function that we call immediately, an IIFE,
  this also gives us the ability to write 'private' methods. They are private
  because they are declared inside an inner method. We can make a new object and
  make it available on the global namespace and add the functions we want to
  that. Functions not on the exported module object can't be called from
  outside, but can be indirectly called by public functions.

### Asynchronous Client Side JS
* traditional while loop will lock browser, have to use setTimeout instead
* requestAnimationFrame is even better, like setTimeout but not duration
* calls about 60 times per second
* can't make a ruby style game loop, instead listen for events and react
* basics of canvas

## Asteroids
  Demo this!! https://github.com/izhou/asteroids

## Demo

### Arguments

* function shopping list
* array-ify `arguments` then print out sequentially

### prototypal inheritance

* draw basic object and its [[Prototype]]
* function has a blank object at `.prototype`
* construct object with function and draw prototypes
* draw Animal --> Dog inheritance
* make ufc fighter inheritance from human

### namespace
* make the module pattern, put previous demo in there
* talk about collisions

### canvas
* show amazing asteroids, asteroidsdamacy.com

*  make the bouncy  demo
*  need a bouncy class and square class
*  bouncy#run(canvas), this.cxt, addEventListener("mouseup", this.click.bind(thi)
*  `#click` creates a new square at the event x and y
*  just draws it at first, then makes a square class and shoves it into array
*  `#run` also starts interval with #tick method
*  make a `bouncy#tick` method that iterates through all squares
*  makea a `bouncy#click` method that takes an event and gets the #x and #y
*  `#click` makes a new square and pushes it into the squares array

      that.ctx.fillStyle = "#F00000";
      that.ctx.fillRect(square.x, square.y, 8, 8);
