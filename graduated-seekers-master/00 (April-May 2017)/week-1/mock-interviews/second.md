# Partner B interviews Partner A
This interview has two questions, a knowledge question and a 'build something' question.

Please spend no more than 5 minutes in answering the knowledge question and no more than 40 minutes in answering the 'build something' question. **Set a timer for each part**

Remember to score them throughout the interview so that you have concrete, constructive feedback at the end during the debrief. Treat this like a real interview!

At the end of the 45 minute interview, spend 5 minutes debriefing.

**Note for the interviewer: during the 'build-something' problem, please treat it like an onsite interview and not as a coding challenge. In other words, your interviewee should engage and communicate with you throughout the problem even though they are coding on their laptops.**

## Knowledge Question (take no longer than 5 minutes)
Explain hoisting.

### Solution
(taken from [scotch.io](https://scotch.io/tutorials/understanding-hoisting-in-javascript))

**Note to the interviewer** There's many directions that the interviewee can go in expanding on this question. The solution below hits some of the main points. For a more in-depth explanation, visit the 'scotch.io' link.
#### Overview
Hoisting is a JavaScript mechanism where variables and function declarations are moved to the top of their scope before code execution.

Inevitably, this means that no matter where functions and variables are declared, they are moved to the top of their scope regardless of whether their scope is global or local.

Of note however, is the fact that the hoisting mechanism only moves the declaration. The assignments are left in place.

Here's an example:
```js
function test() {
   console.log(a); // undefined
   console.log(foo()); // 2

   var a = 1;
   function foo() {
      return 2;
   }
}

test();

```

The above example is essentially the same as:
```js
function test() {
   var a;
   function foo() {
      return 2;
   }

   console.log(a);
   console.log(foo());

   a = 1;
}

test();
```

#### Strict mode
Thanks to a utility of the es5 version of JavaScript known as strict-mode, we can be more careful about how we declare our variables. By enabling strict mode, we opt into a restricted variant of JavaScript that will not tolerate the usage of variables before they are declared.

Running our code in strict mode:

1. Eliminates some silent JavaScript errors by changing them to explicit throw errors which will be spit out by the interpreter.
2. Fixes mistakes that make it difficult for JavaScript engines to perform optimisations.
3. Prohibits some syntax likely to be defined in future versions of JavaScript.

We enable strict mode by prefacing our file or function with:
```js
'use strict';

// OR
"use strict";
```
Let's test it out:

```js
'use strict';

console.log(hoist); // Output: ReferenceError: hoist is not defined
hoist = 'Hoisted';
```

#### ES6
ES6 brings changes in the declaration and initialisation of JavaScript variables.

##### LET
Before we start, to be noted is the fact that variables declared with the keyword `let` are block scoped and not function scoped. That's significant, but it shouldn't trouble us here. Briefly, however, it just means that the variable's scope is bound to the block in which it is declared and not the function in which it is declared.

Let's start by looking at the `let` keyword's behavior.

```js
console.log(hoist); // Output: ReferenceError: hoist is not defined
let hoist = 'The variable has been hoisted.';
```

Like before, for the `var` keyword, we expect the output of the log to be `undefined`. However, since the es6 `let` doesn't take kindly on us using undeclared variables, the interpreter explicitly spits out a `Reference error`.

This ensures that we always declare our variables first.

However, we still have to be careful here. An implementation like the following will result in an ouput of undefined instead of a `Reference error`.

```js
let hoist;

console.log(hoist); // Output: undefined
hoist = 'Hoisted'
```
#### Other potential points of discussion
1. Const variable
2. Hoisting functions
3. Order of precedence
4. Hoisting classes

## "Build Something" Question
Using React, build a digital clock that displays the current (west coast) time (non-military).

This problem will be done on your laptop, but please remember to still communicate with your interviewer throughout. To get started, download the [react-setup.zip](./react-setup.zip?raw=true). Don't forget to 'npm install' and 'webpack'.

### Clarifying points for the interviewee
1. You can only get current time once.
2. You must display hours, minutes, seconds, and AM/PM.
3. Try not to use external resources, but if you must, you can only use MDN and React docs.
4. Style it as best as you can within the allotted time.
5. You have 40 minutes to complete this (please set a timer).
6. Bonus: Add an alarm

### For the interviewer:
1. dateObj.getHours() returns the hour from 0 to 23.
2. Interviewee should pad numbers with zeroes (ie. 02:45:06, not 2:45:6)
Example:
```javascript
// call this pad function in render()
pad(num) {
  if (num < 10) {
    return "0" + num;
  }
  return num;
}
```
3. Interviewees should volunteer to test that their code is working. If not, prompt them to do so.
  * For example, if they write an incrementSeconds() function that is checking whether or not the current seconds is < 60, then they should come up with an example case where the time is 2:05:59, and test that their code is working the way it should be.
4. **Please grade and leave comments on their scorecard as they go. Pay close attention to how clearly they are explaining their code.** They should not be going long stretches without taking the time to explain to you, even if they are struggling.

There are different ways to solve this problem; here's one potential implementation:
[**Solution**](./clock-solution.jsx)
