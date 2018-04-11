[Nov cohort:  Carl](./previous_lectures/november2015.js)  
[June cohort:  Leen](./previous_lectures/june2016.js)  

## Solutions prep

**Expect questions on:**
+ myBind.
  + Show with and without arrow functions!
  + Good to go over, even if no questions, because they write myBindWithArgs today

**Point out:**
+ Clock: You can make the clock tick without `bind` too!
  ```js
  // Bind
  setInterval(this._tick.bind(this), 1000);
  // that = this
  const clock = this;
  setInterval(function () {
    clock.tick();
  }, 1000);
  // fat arrows
  setInterval(() => this._tick(), 1000);
  ```
+ Hanoi: `function completion()` is hoisted. This script would not work if that were an anonymous function stored in a variable. Only named functions are hoisted.

## Lecture

**1) Functional Programming/Currying**
+ Write function which takes arguments successively.
+ `addThreeNumbers`
  + Three times nested functions.
+ `addNumbers`
  + One nested function, `_curriedAdd`, which returns itself.
+ Fun point: No way to actually see the numbers you've used so far. Closures let us actually keep values private.

**2) Prototypal Inheritance**
+ Go through naive solutions
+ Goal:
  ```
    sennacy                 Cat.prototype                Animal.prototype
    {                        {                            {
      title: "Sennacy",        meow: function () {},        eat: function () {},
      __proto__: ->            __proto__: ->                constructor: Animal
                               constructor: Cat
    }                        }                            }
  ```

+ Cat.prototype = Animal.prototype
  + I can't have Cat specific methods
  + `sennacy.__proto__` now points directly to Animal.prototype, skipping middle step of inheritance chain
+ Cat.prototype = new Animal()
  + Sets up chain. Yay!
  + Lot of extra stuff in Cat.prototype. Cat.prototype doesn't need a name! What if the Animal constructor is super complicated?
+ Solution:
  ```js
  Surrogate.prototype = Animal.prototype;
  Cat.prototype = new Surrogate();
  Cat.prototype.constructor = Cat; // Good to have reference to constructor. We lost this when we reassigned the Cat.prototype, so we're going to put it back in! Otherwise sennacy.constructor would point all the way to Animal.
  ```
  + `new Surrogate()` is an empty object with `__proto__` pointing to the Surrogate (i.e. Animal) prototype! This is exactly what we want Cat.prototype to be.
  + Show inheritance chain in Chrome console.
+ Use `call` in order to use functions from ancestor class.

**3) ES6 class inheritance**
+ `class Cat extends Animal`
+ `super`
+ Too easy! We're using `prototype` today so we understand JS interview questions, but we'll use ES6 classes in the future.

**4) Canvas Demo**
+ Point out that as web developers, they'll have to look up/learn new libraries all the time, so we didn't write a reading for this.
+ Quick tour of setup for Canvas.
  + canvasEl
  + ctx
  + don't forget to `fill` circles!
  + Fun aside: show what happens if you don't `clearRect`
+ Bundle.js -- contains ALL the code from required files. In the future, this file will become enormous and crash atom. This demo is small enough for us to view.
+ You can make a local `webpack.config.js` instead of always having to type entry and output filenames.
+ Tell students to test as they go! Even though instructions might not encourage until later in the day....
