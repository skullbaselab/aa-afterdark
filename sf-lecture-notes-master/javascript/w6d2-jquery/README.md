# W6D2: jQuery

---

### Lecture Agenda

+ Today's Material
+ Quiz Q&A
+ Open Forum / Flextime
  + Homework Q&A

---

### Learning Goals

+ Practical understanding of jQuery
+ Not in scope (W6D4):
  + how the DOM works
  + how jQuery works
  + low-level DOM manipulation

---

### Rendering a webpage

1. The browser receives an HTML page
2. It creates a model of the page and stores it in memory.
3. It shows the page on the screen using a rendering engine.

Progressive Enhancement
  + HTML: content layer
  + CSS: presentation layer
  + JavaScript: behavior layer

---

### 3 Groups of built-in objects

1. Browser Object Model (BOM): `window`
2. Document Object Model (DOM): `document`
3. Global JavaScript Objects: String, Date, Math, Regex

![objects](https://frontendlabepam.github.io/FL6/assets/img/windowObjects.png)

https://www.w3schools.com/jsref/obj_window.asp

---
### Document Object Model (DOM)

![dom-tree](https://www.w3schools.com/js/pic_htmltree.gif)

---

### Brief Overview of jQuery

+ around since January 2006
+ one of the earliest good online documentation available
+ `wrapper` library for low-level DOM manipulation
  + write less, do more
  + consistent API for programmers to interact with, regardless of browser
+ tons of libraries / plug-ins built on top of jQuery

---

### Pros and Cons

+ Pros
  + easy to use
  + large library
  + great open source community / documentation
+ Cons
  + limits potential
  + large library (jQuery file needed)

---

### Ways to Use jQuery

+ Selector-style
+ HTML-style
+ Wrapper-style
+ Ready-style

---

### Selector-style

+ input: CSS selector as a string
+ output: jQuery object (array-like) containing all elements that match the selector
+ example: $('li.someClass')

---

### HTML-style

+ input: HTML code as a string
+ output: jQuery object containing the top-level elements you built
+ example: $('<li class=someClass></li>')

---

### Wrapper-style

+ input: unwrapped HTML Element or array of several elements
+ output: jQuery object wrapping those elements, giving you access to jQuery methods
+ example: $(someHTMLVariable)

---

### Ready-style

+ input: function to run when DOM is fully loaded
+ output: nothing
+ example $(() => alert('DOM is fully loaded'))

---

### jQuery Method examples:

+ `hide` & `show`
+ `append`
+ `eq`
+ `addClass`
+ `css`
+ `html`
+ `attr` & `data`
+ `click` & `on` (Event handling)

All here: https://api.jquery.com/

---

### Brief Introduction to Events

+ events: describes most interactions users can have with an app (clicking, submitting, typing)
+ to respond to events, we must install `event listeners` on HTML elements (`on` and `off`)
+ use event.preventDefault();
+ currentTarget vs target
  + currentTarget === element that event listener is attached to
  + target === element that event occurred on

---

# DEMO

---

### Bonus:

+ Animate.css
+ jQuery UI: draggable
+ JavaScript30

---

### Quiz Q&A

[Quiz Solutions](https://github.com/appacademy/daily-quiz/blob/master/js/w6d2.md)

---

### Open Forum

---

### Homework Q&A
[Wacky Painter](https://github.com/appacademy/curriculum/blob/master/javascript/homeworks/wacky_painter/solution/js/view.js)

---

### Questions from Yesterday's Projects



---
