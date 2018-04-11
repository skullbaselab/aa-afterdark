## W6D1

---

## Agenda

+ 5 min Meditation
+ Quick Review from Friday
+ Prototypal Inheritance
+ Webpack
+ Quiz
+ Open Forum

---

## Bind

`setInterval(this._tick.bind(this), 1000);`

---

## Arguments

+ `arguments` is an array-like object
  + `[]`
  + `length`
+ Holds all arguments passed in whether they are named or not
+ Common to turn `arguments` into a *real* array
  + `Array.from(arguments)`
  + `Array.prototype.slice.call(arguments)`
+ More common to use the 'rest' operator (`...args`) in ES6

---

## Inheritance

One object gets access to the properties and methods defined on another object

---

## Constructor Functions

+ Special type of function meant to create an object
+ Made to be used with the `new` keyword
+ Accepts arguments to set the new object’s properties
+ Paired with a `prototype` object

---

## The `new` Keyword

1. Make a new object
1. Assign the `__proto__` and `constructor` of the new object to `Constructor.prototype` and `Constructor`, respectively
1. Make the `this` variable point to the newly created object
1. Call the constructor function in the context of that new object
1. Automatically returns the newly created object

```
function Shape(color) {
  this.color = color;
}
const blueShape = new Shape("blue");
```

Note:
By convention, constructors are named with a capital first letter, much like a class in Ruby.

---

## Constructor Code Demo

---

## Prototypes

+ Every object is associated with a prototype object
  + Access through `__proto__`
  + Better, `Object.getPrototypeOf(obj)`
+ If an object doesn't have a property it looks at its prototype through `__proto__`
  + Keeps looking up its prototype chain
+ If you want to access an object's prototype  `Object.getPrototypeOf(instance)` is preferred over `instance.__proto__`

Note:
Except `Object.prototype` because it is at the top of the chain.

Why avoid `__proto__`:
https://gist.github.com/WebReflection/5282385

---

## Prototypes Code Demo

---

## Prototypal Inheritance Example

+ Want to make a `Rectangle` and a `Circle` that both inherit from `Shape`
+ Both `Rectangle` and `Circle` need `Shape`'s prototype methods
+ Both `Rectangle` and `Circle` need their *own* `prototype` methods

---

## Surrogates (i.e. the old solution)

```
function Surrogate () {};
Surrogate.prototype = Shape.prototype;
Rectangle.prototype = new Surrogate();
Rectangle.prototype.constructor = Rectangle;

Circle.prototype = new Surrogate();
Circle.prototype.constructor = Circle;
```

Note:
Why do we not just use an instance of Shape?
+ Because there could be undesired side effects in the constructor function.
Why do we not assign `__proto__`?
+ It is inefficient and an anti-pattern

---

## `Object.create` (ES5)

Released December 2009

```
Rectangle.prototype = Object.create(Shape.prototype);
Rectangle.prototype.constructor = Rectangle;

Circle.prototype = Object.create(Shape.prototype);
Circle.prototype.constructor = Circle;
```

---

## Class Syntax (ES6!)

Released June 2015

```
class Circle extends Shape {

  constructor(color, radius) {
    super(color);
    this.radius = radius;
  }

}

class Rectangle extends Shape {

  constructor(color, height, width) {
    super(color);
    this.height = height;
    this.width = width;
  }

}
```

Note:
Why do we need to know all of these ways?
+ You may encounter any of these in a code base and you will need to know what's going on.
+ Also, they are all valid so you could be asked to do a specific one in an interview.

---

## ES6 Class Syntax Example

---

## Webpack

+ Module (i.e. file) bundler
+ Recursively builds a dependency graph that includes every module your app needs
+ Packages the modules into a single 'bundle' file which is sent to the client and loaded by the browser
+ Use: `webpack root.js bundle.js`
+ Motivations:
  + Can't use `require`/`module.exports` in browser
  + Listing every file in the script tags is unwieldy

---

## Webpack Demo

---

## Asteroids "Demo"

---

## Quiz

[solution](https://github.com/appacademy/daily-quiz/blob/master/js/w5d5.md)


