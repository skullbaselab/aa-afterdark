[November cohort:  Jonathan](./previous_lectures/november2015.html)  
[February cohort:  Tommy](./previous_lectures/february2016)  

## Solutions prep

**Expect questions on:**
+

**Point out:**
+

## Lecture
Suggestion: Have skeleton of jQuery demo available so that you can demo jQuery methods through the console during lecture.

**1) DOM elements vs jQuery objects**
+ jQuery is a library of javascript
  + Used to be more prevalent bc browsers all had different ways of interacting with the DOM. jQuery papered over these differences
+ jQuery objects are a collection of DOM elements with extra, easy-to-use methods
  + http://api.jquery.com
  + Shown in console in square brackets(like an array!)
  + Elements INSIDE a jQuery object are DOM elements
    + Show `$(li)` vs `$(li)[0]` in Chrome console. Type `.` to show how one has jQuery methods, the other has DOM methods.
+ jQuery methods often alter every DOM element in a collection. You don't have to worry about iterating. So convenient!
  + Demo changing class, addding text, to a lot of DOM nodes at once via Chrome Console.

**2) Four uses of $**
+ Show examples of the four ways in your skeleton
  + Selector: any CSS selector: class, id, tagname
  + HTML-creator: Pass in string of HTML
  + Wrapper: Wrap any DOM node/NodeList so that you have jQuery methods available.
  + ready -- explain after talking about events

**3) Game and Event Listeners**
+ Events: This is why Javascript is so important! Async behavior.
+ `#on` method, takes string of event type and a callback
+ Events bubble up
  + Can add listener on parent elements. This is nice if you're going to add more elements later.
  + Example: click listener on 'li's in CatClick. Since we add more 'li's later, better bind the listener to the parent container.
+ $ fourth way, `$(callback)`, is just `$(document).on('ready', callback)`
