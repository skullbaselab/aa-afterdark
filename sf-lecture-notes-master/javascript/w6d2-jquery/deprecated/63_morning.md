# DOM
+ Tree structure: nodes, parents, children
+ Natively supported by browsers; however, support is not always standard
  and tends to provide minimal function
  + Standardization is improving (thanks to disappearance of old IE, mostly)
+ Native functions live on the `document` object (not to be confused with the
  global `window` namespace)
+ Libraries to standardize and abstract across implementations are common;
  jQuery currently dominates

## jQuery

+ Utility library: DOM manipulation, event handling, AJAX
+ Extremely common (look for `$` on major web sites) but still just a library
  + Demo: cover Reddit in placekittens; change username on Github
+ For today: focus on manipulating DOM elements, esp toggling classes
+ Core method: `$(selector)`: returns a jQuery collection of the DOM elements
  that match `selector`; `selector` can be any valid CSS selector (or
  combination of selectors)
+ `$(tag)`: creates a new tag in memory and returns it in a collection; you
  must insert it into the DOM
+ NB: `$('li')` and `$('<li>')` do completely different things; be careful!
+ jQuery methods tend to be well-behaved and save effort and danger of writing
  HTML by hand; prefer chaining jQuery to writing out HTML strings in most
  situations
+ In general: jQuery methods that **change** attributes will apply to all
  elements in the collection, while those that **read** attributes will take
  the first value

## Snake and Towers

+ Two approaches: create/destroy/move DOM elements or change properties of 
  fixed elements
+ In order of preference: change > move > create/destroy
+ Two approaches to changing properties: in-line styling and class-based
+ Classes are preferred: keep code encapsulated (by keeping properties in CSS),
  requires less work from jQuery and the browser
  + in-line can be useful in a few situations: mainly temporary one-element
    positioning
+ Not that big a deal for Hanoi, but Snake will stutter if done inefficiently
+ Key methods: `$.fn.addClass` and `$.fn.removeClass` add and remove classes
  + `$.fn.toggleClass` is tempting but may introduce subtle sequencing bugs;
    best to avoid unless you explicitly want sequencing dependence
