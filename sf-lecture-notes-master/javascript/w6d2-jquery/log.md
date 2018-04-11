# January 16, 2017

### Lecturer: Anastassia Bobokalonova
### Scribe: Ryan Mease

### Lecture Questions

+ What's the difference between text and .html? 
  + If you do just text, it will only give you the text without the tags 
+ When we looked at the events, we saw that there was bubbling
   + When an event fires, it will bubble up to all the containing elements 
+ Is there a reason that you have code style, Anastassia?
  + :)
+ Is there a way to inspect the data for an element? 
  + You can select the element and then call .data() to see all of the attributes 
  

# November 7, 2017

Lecturer: Anastassia Bobokalonova
Scribe: Kelly Chung

### Lecture Questions

1. What does it mean by top-level elements?
  + It will not construct any nested HTML elements in HTML-style
1. Headings is a jQuery object, but when you index into the collection,
it returns an HTML element?
  + Yes
1. Does appending jQuery objects into the DOM show up in the tree?
  + Yes
1. Does `siblings` affect the element the method was called on?
  + *Demos* - no, only affects siblings
1. Will we have access to the code afterwards?
  + Always available on SF-lecture-notes
1. There was an `off` function as well. Can you show us how that works?
  + Yes - *demos*
1. Do you have to identify both parameters (for `off`) to uninstall
a specific event listener?
  + Yes
1. What would be the vanilla DOM equivalent of `off`?
  + Something like `removeEventListener`
1. Will the `event.target` will always be the most nested thing that you
clicked on?
  + No, *gives counter example*

# September 5, 2017

Lecturer: Hope Wanroy
Scribe: Kelly Chung

### Lecture Questions

1. What is the `eq` method do?
  + Say you selected for all the images with jQuery - and you just wanted
  the second one. `eq` allows you to index into the jQuery object and
  return a jQuery object.
1. Can you just use bracket notation?
  + Absolutely - but you can also `eq` to handle negative indices.
1. Does CSS only work inline styles as opposed to an external sheet?
  + You can't change the external sheet - but you can override with
  inline styling.
1. Does that mean `eq` will return a jQuery object, not just an HTML object?
  + Yes
1. So I assume negative indices will behave like Ruby indices?
  + Yes
1. How is prepend adding the image string if it's not a jQuery object?
  + It will check to see if it's a jQuery object or HTML element, and
  convert either to the appropriate data type.
1. What type of element is the element with the id corgis?
  + It's a `ul`
1. When we removed the angry corgi, is there just a space left?
  + It completely removes an HTML element - so that space is just taken

# 5/1/2017

Lecturer: Kelly
Scribe: Gage

## Practice Assessment
+ no questions
## JQuery
+ does jquery use vanilla js to do things?
  + yes.
+ what's the difference between .eq and [idx]?
  + .eq is neater because it returns a JQuery object directly
+ is there an HTML class in JavaScript?
  + yes
+ how do you require the JQuery library?
  + a <script> tag in the head of an HTML document
+ should we host our own jQuery files or use a CDN?
  + use a CDN
## Demo
+ could you zoom in?
  + **zooms in**
+ what if you don't capture the event?
  + you don't need to capture it if you don't use it
+ why were you able to ??
  + the information we got was the same
+ what does .html do?
  + it sets the innerHTML of a jQuery element
+ currentTarget vs. target?
  + we'll get into that later
## Quiz
+ HTML element vs. a node list?
  + node list is an array(-like object) of HTML elements
+ is $('ul.test').('on', 'li', 'click') the same as
$('ul.test li').('on', 'click')?
  + i think in this case it is, yes
---
## Optional Zone
(11:15-11:30)
## General
+ jQuery uses .each; JS uses .forEach?
  + jQuery objects aren't technically arrays
+ when should we use .css()?
  + when you want to create inline styles (you shouldn't)
+ currentTarget vs. target?
  + currentTarget returns event-listening element; target returns event
  triggerer
+ data() vs. attr()?
  + data stores data in a jQuery object; attr stores data in the DOM
    + can people change an element's data?
      + yes, using jQuery
+ will data() secure your information?
  + no. nothing on the frontend is "secure"
+ is data-id different from id?
  + yes, they are different. id is a CSS selector.
+ what is attr()?
  + sets an attribute on the HTML element in the DOM
+ does attr() only work on attributes that already exist?
  + no. (best demonstrated with an example)
## Notes
+ i like trying the no-questions-until-the-end format
+ make the text on the screen even bigger
+ .text() similarly to .html() https://api.jquery.com/text/
  + it's easy to look up methods online; jQuery has good SEO
+ make sure you know about event delegation
  + $('ul.test').('on', 'li', 'click') !== $('ul.test li').('on', 'click')
+ attr() and data() are used in today's projects
  + probably worth reviewing the projects to see what is high-priority
  to cover in lecture (addClass, attr, data, &c.)
+ demos illustrated the answers to problems well
+ make sure to keep talking as you're writing a demo

# 2/27/17

Lecturer: Gage

Notes by Shamayel

## Asteroids Day

* Currying?
 * The idea of currying is that we don't want to pass all the arguments to a function at once
* What would happen if we passed more than one argument to the initial curry call?
 * It would get ignored
* If we didn't originally return the inner curried function, what would happen?
 * We'd get `undefined` returned back on the initial function call and wouldn't get anywhere
* How does returning work in the inner curry function? How do we get out of the inner function?
 * We're already out of it because the subsequent calls are invoking the inner function by itself

## jQuery

* What's the difference between `.click` and `.on`?
 * Click is shorthand for on click. On also lets you do event delegation
* Did adding a listener to the `a` tags override previous functionality?
 * No
* What if you have multiple attrs with the same name?
 * It'll return the first one
* Do single vs double quotes matter?
 * No
* How do you handle iterating over elements?
 * Use jQuery's `each` function
* How do you know if you're using a jQuery element vs HTML element?
 * Look at the return value for everything
* What if you want to look at a particular `a` tag?
 * Use `eq` to select the one you want
* Does changing an existing attr overwrite it?
 * Yes
* What's the difference between using `eq` and indexing into a list of `a` tags?
 * `eq` returns a collection with that item in it, indexing just returns the HTML element
* Do you get a collection back even with `id`?
 * Yes
* There are so many different ways to do things, what's the best way to do it?
 * Use classes over ids, use separate tags when you can. This is a really general question
* If you have a lot of code that needs to wait on the DOM loading, do you put it all in the listener?
 * Yes. If there's a lot of it, put it in another file
* Is this the same as `document.ready`?
 * Yes
* What if you put the `jQuery` at the bottom of the file?
 * jQuery itself can take a while to load; it's a big library. Putting it at the bottom means the HTML will get to load first before the library starts loading
* Is there a way to offset the loading of other files until certain things have loaded?
 * Yes, we won't get into that
* What's the deal with defining variables starting with a `$`?
 * It's a way to indicate that a function should be called with jQuery objects or to label a variable as a jQuery object

## Homework

* What's the best way to order CSS styles?
 * You can go from the top down. More importantly, work from most general to most specific
* Why do we assign stuff to `window`?
 * `window` is global in browser-based JS, gives us access to those things in the console to test or anywhere else in the code
* Why limit the reset file to only stuff on our page?
 * Browser optimization
* Should we reset `select` or `option`?
 * In general no, unless you have plans for them
* What's `e.currentTarget`?
 * `e` is the event. It has a lot of properties, like `target` and `currentTarget`. It lets us see what element got clicked and what element triggered the event
* If we have listeners on the `a` and `html`, which takes precedence?
 * They fire in the order that they're hit, so `a` first.
* Are event handlers expensive to make?
 * No

## Quiz

* Instead of delegating, could you just be more specific about the tag and use `click`?
 * Yes, but the difference is that using `click` will put a listener on every child and using delegation puts the listener on the parent and lets all the children be listened to


## 6/15/2016

Lecturer: Claire Rogers

### Questions

  * What does `.eq()` do
  * Difference between `mousedown` and `mouseenter`

### Notes

  * Very few questions - lecture ended after ~20 min
  * There were no questions on CSS friends
  * For the few questions that were asked, I live demoed in dev-tools to explain how certain properties worked.  I think that was very helpful, and it provoked more questions.
