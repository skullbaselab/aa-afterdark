### Intro To Callbacks: File I/O
* callback is a function passed to another function to be executed later
* `setTimeout` takes a callback
* closure: saved scope in side of a function, just like a ruby block
* JS is asynchronous, many functions IMMEDIATELY return. But when they
  are done with their business, pass their payload to a callback
* timers, web requests, event registration, all return instantly, and
  will trigger a callback later
* node I/O is asynchronous, all receive callbacks to execute later
* `reader.question` takes a prompt and a callback to execute when the
  prompt is responded to
* ITS NOT ABOUT THE RETURN VALS
* exercises: make a clock in the terminal, add two numbers using
  `reader`, `absurdBubbleSort`

### This and That
* `this` is reset every time a function is called
* when we call a function 'method style', `this` is set to the object we
  called the function from
* calling a function 'function style' `this` is the global object
* can get around this by passing an anonymous function and making a
  closure over the object that we want to be `this`
* can also `bind` to lock in the context
* `forEach` executes callback function style
* we can store `this` in a local var, then in the closure we refer to
  the local var instead of this. Often `that`

### Ways to Call a Function
* Function Style - this is ??? not set to anything reliable
* Method Style  
* Constructor Style
* Apply(context, arg array)
* Call(context, arg list)

* MYBIND!

### Node Modules
* ruby just evaluates entire files into the global namespace
* in node, when a file is `required` it is evaluated and whatever the
  value of `module.exports` is is returned. So put stuff into or replace
  `module.exports` to decide what becomes globally available.

### Demos
* callbacks
* console IO
* make microwave example for that, two layers of callbacks
* explain event loop
* all ways to call a function
* bind
* this and that
* node modules
