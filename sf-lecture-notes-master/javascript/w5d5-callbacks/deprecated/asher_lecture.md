Asher lecture notes:

- PREP: Mic

this and that

- think of "this" as "self" in ruby

- 4 ways to call a function.
  - "Call a function" is every time you have parentheses.
  - This is the one thing you just gotta memorize.  Either you've memorized it or you haven't. Draw out table:
    - Function | jump() | window
    - Method   | elephant.stomp() | whatever's before the dot
    - Constructor | new Elephant() | the elephant instance
    - Call/Apply | (swim = function(){};) swim.call(fish, args) | the first argument
  - Demo each in console.  Log out what "this" is.
  - "Call a function" is every time you have parentheses (repeat, point on board at these)


Assigning "that".
  - WRITE CODE DEMO (that.js).
  - Break it, then fix it.
    - This.name is undefined
    - Console log this
  - Hey, this is an example of a closure (Jeff may have referenced them yesterday)
  - "that" is this, outside of the inner function.  I prefer to call the outer "this" "dog" or "cat": the name for what "this" actually is.  In practice, you see both.
  - You might see "that" in our examples, it can be hard to follow.  Try to name "this" in every case.

  - Bind:
    - Do example with bind. (We're going to do an exercise with this.  Students traditionally have a hard time with this.)

Event loop
  - I want to give you a couple analogies and mental models, then I'll show you the actual code
  - Analogy: How many people here have had an intern or been an intern before?
    - "Hey I'm done!  What do I do next?": and the boss goes "hang on, I'm on a call"
    - Same thing with a friend
    - So you basically keep bugging them
  - Analogy 2: making breakfast
    - Boil the hot water for tea while I do the dishes.
    - Actually add tea bag when i'm DONE doing the dishes
    - Write pseudocode for makeTea(), doDishes()
  - Analogy 3: President (Barack Obama) asking his peons (cabinet) to do things.
    - DRAW STICK FIGURES
    - Obama goes to his Secretary of Defense, says "hey, give me a report on North Korea".  Once you have the report, I'll give Kim Jong Un a call.
    - So Secretary starts making the report.
    - Obama goes on CNN and gives address to the nation
      - So two things are now happening at once (secretary and CNN address)
    - Finishes making his address, waiting around.
    - Then secretary comes back with the report.

  - Spend 20 seconds and write down for yourself in your own words what it is.
  - My definition: firing off things all at once, dealing with them one at a time when they come back.

  - What if secretary had come back early?
  - Obama can only do one thing at once: single threaded...

  - Top-level, everything goes in a "Message" queue?
  - Call stack
  - Web API (what puts things in the message queue, such as a button click)


Demo1: Loupe visualizer: with setTimeout to see that you use the webAPI to execute later.
  Paste in the following.

  console.log("Hi!");

  setTimeout(function timer() {
    console.log('Two seconds later!');
  }, 2000);

  console.log("Still the first second.");

  - See how WEB API can sort of do multiple things at once.  That's not even part of the javascript.

