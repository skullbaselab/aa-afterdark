# W6D2: jQuery

---

### Lecture Agenda

1. Today's Material
1. Demo
1. Quiz Q&A
1. Open Forum

---

### Learning Goals

+ Practical understanding of jQuery!
+ Not in scope:
	+ how the DOM works
	+ how jQuery works
	+ low-level DOM manipulation

---

### Document Object Model

+ interface: set of methods + attributes to interact with
+ browser's JavaScript interface that facilitates manipulation of the webpage
+ represented as a DOM Tree

---

![dom-tree](https://developer.mozilla.org/@api/deki/files/415/=Using_the_W3C_DOM_Level_1_Core-doctree.jpg)

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

### DEMO: jQuery Methods

+ `hide` & `show`
+ `append`
+ `eq`
+ `css`
+ `attr` & `data`
+ `html`
+ `addClass`

Bonus:

+ `slideUp`

---

### Brief Introduction to Events

+ events: describes most interactions users can have with an app (clicking, submitting, typing)
+ to respond to events, we must install `event listeners` on HTML elements (`on` and `off`)
+ don't forget to event.preventDefault()
+ currentTarget vs target
  + currentTarget === element that event listener is attached to
  + target === element that event occurred on

---

# DEMO: Events
+ Convert vanilla DOM manipulation to jQuery
+ `click` & `on`

---

### DEMO: Libraries Built on Top of jQuery
+ jQueryUI
+ animate.css

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
