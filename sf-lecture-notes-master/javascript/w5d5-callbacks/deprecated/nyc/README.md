[June cohort:  Patrick](./previous_lectures/june2016.js)  
[August cohort: Maurice](./previous_lectures/august2016.rb)

## Solutions prep

**Expect questions on:**
+ Putting function in prototype vs. putting function in instances.
  + Recreating `meow` function in constructor would put a new `meow` function in every cat! Takes up lots of memory
  + Every cat has a different `meow`. Can't change `meow` easily for every cat.
+

**Point out:**
+ Good idea to break down one of the enumerables, like myMap, so you can go over callbacks. Make a multi-liner!

## Lecture

Note: Bind is tricky. Be prepared to use the debugger A LOT. Put a debuggers in between the #bind actually invoking a function to emphasize that bind does NOT invoke the function.

**1) ES6 classes**
+ Emphasize: This is syntactic sugar!
+ Suggestion: Have code from reading up (Bicycle class).
  + `Bicycle` is a function
  + `Bicycle.prototype` is populated with the named functions.
    + `methodName`: `methodName() {}`
  + `static` keyword attaches functions to `Bicycle` instead of `Bicycle.prototype`

**2) Ways of calling a functions**
+ Review the 3 original Ways and context
  + Method, Function, Constructor
  + Suggestion: have some sample code up, and ask students to find an example and state the value of `this` for each of the three ways.
+ Two more ways!
  + Call. Make a `detachedMeow`. Use it to make a cat meow. Then make a cat bark.
  + Apply. A for array! Lets you pass in an array or arguments. This was more useful in ES5, in the days before the rest operator.

**3) Bind**
+ Problem: invoking things function style is hard. The context is always lost!
+ Example:
  + write times function: example of invoking callback FUNCTION STYLE.
  + `const detachedMeow = sennacy.meow;`
  + times(3, detachedMeow) => doesn't work
+ Solutions:
  ```js
    const betterDetachedMeow = function () { sennacy.meow() }
    const boundMeow = detachedMeow.bind(sennacy)
  ```
  + Both solutions work in `times`
  + `bind` is a method on the Function prototype which returns a new, bound function. IMPORTANT: calling `bind` on detachedMeow DOES NOT invoke detachedMeow

**4) Context matters!**
+ Since the detachedMeow example is a bit isolated, show that context matters in another instance method
  + Suggestion: `Cat.prototype.sayHi` which calls `meow` three `times`
  + Solutions to context problem:
    + `const cat = this`; (or `that = this`) with anonymous function
    + `bind`
    + Big reveal: fat arrow! Not need for `that = this`. You can use `this` in fat arrow callback because the context inside a fat arrow is the same as the context outside the fat arrow.
  + In today's exercises, practice using `bind` instead if fat arrows. It's super important and tricky. You'll appreciate fat arrows so much more later if you struggle with `bind` first.

**5) Readline library**
+ Note: we'll only use this library today so we can practice asynchronous functions before using JS with the internet. It's a little finicky and you have to run in node, not chrome. Run `node <filename>` instead of opening up node and `require`ing the file, because readline will be buggy and duplicate letters.
+ Syntax for setting up reader: don't need to memorize, just copy from notes.
+ 1) Basic question/answer. Close reader in callback.
  + Show how console.log in bottom of file runs BEFORE console.log in answer callback.
+ 2) Try to loop a question
  + Show naive solution of `while (true) { askQuestion() }`
    + Keeps calling `reader.question` without waiting for the response!
  + better solution: call `askQuestion` INSIDE the response callback to `reader.question`
