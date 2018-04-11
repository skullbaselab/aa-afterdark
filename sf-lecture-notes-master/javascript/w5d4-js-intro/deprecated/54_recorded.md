# Week 5 Day 4

### YavaSkripten History

- JS is almost 20 years old (May 1995)
- Brendan Eich made JS in 10 days

- May 1995 ( **Mocha** )
- Sept 1995 ( **LiveScript** )
- Dec 1995 ( **JavaScript** )
- ECMA 1997 ( **ECMAScript** - European Computer Manufacturers Association Script )
- 98 ( **ECMAScript2** )
- 99 ("JS2")
- ...
- 2009 ( **ECMAScript5** )
  - if you add `'use strict';` to your JS file, it'll force it to use ECMAScript5
- TC39 **ES6**
- **ES7**

**Hatin' on IE:** IE doesn't like trailing commas so it'll just crash silently `[1, 2, 3,]`.


### Writing JS

```js
for (var i = 1; i < 22; i++) {
  if (i % 2 === 1) {
    console.log(i);
  }
}
```

- Two ways to define a JS function

```js
// this errors out because you can't call a before it's defined
console.log(a());
var a = function () {
  return 3;
}

// this is ok and will print 3
console.log(a());
function a() {
  return 3;
}
```

```js
var arr = [1, 2, 3];
// prints property of object instead of value
for (var el in arr) {
  console.log(el);
}
// 0
// 1
// 2
```
 Another looping mechanism
 ```js
 arr.forEach(function (el) {
   console.log(el);
 });

 ```

Write our own `each`

```js
Array.prototype.myEach = function (cb) {
  for (var i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

arr.myEach(console.log);
```

### Testing

```html
<!DOCTYPE html>

<html>
  <head>
    <script src="demo.js"></script>
  </head>

  <body>
  </body>

```

### JS Objects

```js
Array.prototype.mySlice = function () {
  return 0;
}

// one way to construct an object
var cat = {
  name: "gizmo",
  age: 7,
  meow: function () {
    console.log("meow");
  }
}

cat.meow();
// same as
cat['meow']();

var dog = {
  name: "fido",
  age: 7,
  meow: function () {
    console.log("meow");
  }
}

function Animal(name, age) {
  this.name = name;
  this.age = age;
  // this is bad because every copy of animal has the below function
  // this.meow = function () {
  //   console.log("animal meow")
  // }
}

// it's better to do
Animal.prototype.meow = function () {
  console.log("animla meow");
}

// another way to construct an object
var gizmo = new Animal("gizmo", 7);
```

### Scope

```js
var a = function () {
  var b = function () {
    var c = function () {
      // you can call a in here
      return 3;
    }
    return 3;
  }
  // you can't call c here
  return 3;
}
```

### A closure is a function which accesses variables that are neither passed in nor defined inside that function


```js
// one way
var counterObj = {
  count: 0
};

function counterWithObj() {
  counterObj.count += 1;
  console.log(counterObj.count);
}

counterWithObj();


// another way
function myCounterGenerator () {
  var _count = 0;
  return function () {
    _count += 1;
    console.log(_count);
  }
};

var counter = myCounterGenerator();
counter();
counter();
counter();
counter();
counter();
```
