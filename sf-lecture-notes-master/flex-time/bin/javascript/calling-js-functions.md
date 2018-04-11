# Calling JS Functions

**NB** mention this is a contrived example. This is not how we want to assign
functions to an instance of a contructor. They should normally be put on the
prototype, some benefits are discussed below.

## Sample Constructor

Let's use this as an example constructor. Notice that both `this.f` and
`this.a` are _defined_ in the Dog instance context.

```js
function Dog(name) {
  this.name = name;

  this.f = function() {
    console.log(this.name);
  };

  this.a = () => {
    console.log(this.name);
  };
}
```

Let's try to call `f` and `a` in different ways:

## Assign functions to variables

```js
const shadow = new Dog("Shadow");

let f = shadow.f;
let a = shadow.a;
```

## Method style
These both refer to the original `this.f` and `this.a` that are defined _on_
the dog instance, not local variables `a` and `f` above.

```js
shadow.f(); 
shadow.a();
```

Both method-style function calls will work. `this.f` is called with its
context set to `shadow` because it is a normal function that is called method
style. `this.a`, even though it looks like it is called method style, is just
calling the arrow function that is referenced on shadow. Its context was
already set on _definition_ of `this.a` when `new Dog()` was called and can't
be changed.

## Function style

```js
f(); // Will print undefined; no property `this.name` for global scope
a(); // Will work; `this` context is bound on arrow function _definition_
```

## Using Call, Apply, Bind

We can fix `f()` by giving it a context through `call`, `apply`, or `bind`.

```js
// 1
f.apply(shadow); // takes arguments as an array
// 2
f.call(shadow); // takes arguments as a list
// 3
f = f.bind(shadow);
f();
```

## Why Not Define In Constructor?

This brings up the question, why do we define normal functions on the prototype
if we're just going to have to define its context later anyway? It seems super
convenient to just define an arrow function in the constructor and always have
bound functions whenever we make a new `Dog`!

Well, for one, this means that every instance of a `Dog` must hold its own
uniquely bound function with it. That could be a lot of copies of the same
function if it doesn't always get used.

It also does not allow us to ever use that function with another object that
has similar properties to it. Let's look at an example:

```js

Dog.prototype.f = function() {
  console.log(this.name);
};

function Cat(name) {
  this.name = name;
}

const herald = new Cat('Herald');

Dog.prototype.f.call(herald);
// or
Dog.prototype.f.apply(herald);
```

## Question for Students

Let's write a function `double` that uses `arguments` and returns an array of
the args, all doubled. _Without_ converting `arguments` into an array first.

```js
function double() {

}

double(2,6,3,4) // returns [4, 12, 6, 8]


// solution

function double() {
  return Array.prototype.map.call(arguments, (el) => el * 2);
}
```

## Another Prototype Example with `NodeList`

This can be very useful for classes like `Array` and `NodeList`!

```js
// returns a NodeList
const elements = document.querySelectorAll('div');

const arr = Array.prototype.map.call(
  elements,
  (el) => el.innerText
);
```
