# Vanilla DOM Manipulation

---

Congrats on finishing A05!

---

![corgi-uno](http://3.bp.blogspot.com/-6R7UTUvn-8w/TdG814WVfLI/AAAAAAAAJew/YoqjB2r9ujg/s1600/believe.jpg)

---

![corgi-dos](https://media.tenor.com/images/8739c554767c092eccd2eb46390a4d5d/tenor.gif)

---

### Learning Goals

  * Events
  	* Event Handlers/Listeners
  	* Event Bubbling and Delegation
  	* target vs currentTarget
  * Web APIs
  	* `Document`, `History`, `Location`, `XMLHttpRequest`
  * Vanilla DOM Manipulation <> jQuery

---
## Events

* "Things" that happen to HTML elements.
* An event can be something the browser does or something a user does.
* Examples:
	* A web page has finished loading
	* An input field was changed
  * A button was clicked
* JavaScript code can react to these events via event _handlers_ or _listeners_ installed on HTML elements.

---
## Common Event Listeners

* `onchange`: An HTML element has been changed
* `onclick`: The user clicks an HTML element
* `onmouseover`: The user moves the mouse over an HTML element
* `onmouseout`: The user moves the mouse away from an HTML element
* `onkeydown`: The user pushes a keyboard key
* `onload`: An object has been loaded.
---
## Problem

* Let's say that we have a parent element with several child elements
* Let's also say that something needs to happen when each child element is clicked
* You could add a separate event listener to each individual child element, but what if the child elements are frequently added and removed?
* Adding and removing event listeners would be a _nightmare_
* Additionally, event handlers can potentially cause memory leaks and performance degradation — the more you have, the greater the risk.

---

## Solution: Bubbling and Event Delegation

  * Allows you to avoid adding event listeners to specific nodes
  * Instead, the event listener is added to a common parent.
  * Bubbling Principle: after an event triggers on the deepest
  possible element, it then triggers on its parents in nesting order.
  * The event listener analyzes bubbled events to find a match on child elements.

---

![delegation1](http://www.java2s.com/Book/JavaScriptImages/eventBubble.png)

---

![delegation2](http://s3.amazonaws.com/37assets/svn/845-bubbling.png)

---

### Target vs currentTarget

  1. `Event.target`: A reference to the object where the event occured. This object "dispatched" the event.
  1. `Event.currentTarget`: A reference to the element on which the event handler has been attached. as opposed to `event.target` which identifies the element on which the event occurred.

---

# Events Demo!

Note:
- events.js demo

---

## Web APIs

* An API is not a beer.
* An Application Programming Interface is an interface which has a set of functions that allow programmers to access specific features or data of an application.
* Web APIs are APIs for either a web server or a web browser.
* Web APIs are typically only accessible from the application's client-side.
* [MDN's List of WEB APIs](https://developer.mozilla.org/en-US/docs/Web/API)

---

## The DOM (Document Object Model)

* The DOM is a cross-platform and language-independent application programming interface (API) that treats an HTML, XHTML, or XML document as a tree structure wherein each node is an object representing a part of the document.
* The objects can be manipulated programmatically.
* Any changes are reflected in the display of the document.
* In other words, the DOM allows you to perform CRUD operations on HTML elements.

---

![DOM](https://upload.wikimedia.org/wikipedia/commons/5/5a/DOM-model.svg)

---

## `window.document`

* When an HTML document is loaded into a web browser, it becomes a `Document` object.

* The `Document` object is the root node of the HTML document and the "owner" of all other nodes.

* The `Document` object provides properties and methods to access all node objects, from within JavaScript.

* A reference to the `Document` object exists as a property on the `Window` (i.e. `window.document`)

---
## History

* The `window.history` read-only property returns a reference to the `History` object

* The `History` object provides an interface for manipulating the browser session history (pages visited in the tab that the current page is loaded in).

* For security reasons the History object doesn't allow code to access the URLs of other pages in the session history, but it does allow it to navigate the session history.

* There is no way to clear the session history or to disable the back/forward navigation from your code.
---
## History methods

* Moving backward and forward through the user's history is done using the `window.history.back` and `window.history.forward`.

* You can also use the `window.history.go` method to load a page identified by its relative position to the current page (with the current page being relative index 0).

  * (i.e. `history.go(-4)` goes back 4 pages.)


* You can determine the number of pages in the history stack via `window.history.length`:

---
## Location
* The `window.location` property returns a reference to the `Location` object.

* The `Location` object contains information about the current URL.

---
## Navigating with Location

* To go to a page all of these are equivalent
	* `window.location.assign(url);`
	* `window.location = url;`
	* `window.location.href = url;`
  * `window.document.URL` (READ ONLY)

* `window.location.replace(url)` replaces the current item of the session history with the provided URL.
---
## Location Demo!

---
## XMLHttpRequest

* Use XMLHttpRequest objects to make AJAX requests to interact with servers
* You can retrieve data from a URL without having to do a full page refresh. (Asynchronicity!)
* Enables a Web page to update just part of a page without disrupting what the user is doing.

---
## XMLHttpRequest.readyState
* 0: UNSENT => 	Request object created. `.open` not yet called.
* 1: OPENED	=> `.open` has been called.
* 2: HEADERS_RECEIVED => `.send` has been called and headers are available.
* 3: LOADING => Downloading; `.responseText` holds partial data.
* 4: DONE	=> The operation is complete.
---

## XMLHttpRequest Example!

---
## Side note

* `Document` and `XMLHttpRequest` are regular constructors, while `History` and `Location` are _mysterious_ **interfaces**

---
## jQuery?
* **Pros**
	* Low-level => fast
  * Rapid Development
  	* concise: "write less, do more"
  	* Simplifies "complicated" AJAX calls and DOM manipulation
  * Very easily extendable.
  * Most popular JavaScript library.
* **Cons**
  * [you-dont-need-jQuery](https://blog.garstasio.com/you-dont-need-jquery/why-not/)

---
  
## Is jQuery lightweight?
| Library													 |Size (kB)|
|----------------------------------|---------|
| Vue 2.4.2                        | 20.9    |
| jQuery 3.2.1                     | 32      |
| React 16.2.0 + React DOM + Redux | 33.8    |
| Ember 2.2.0                      | 111     |
| Angular 2                        | 111     |
---
## 86 kB

![afghan girl](http://cdn.cnn.com/cnnnext/dam/assets/150109115802-afgrl-10001-exlarge-169.jpg)

---

## JQuery Lite

---

**Example 1:** Waiting for the DOM content to load.

```javascript
$(() => {
  alert('LOADED!');
});

document.addEventListener('DOMContentLoaded', () => {
  alert('LOADED!');
});
```

---

**Example 2:** Finding elements that match a selector.

```javascript
const jqueryWay = $('.some-class');
const domWay = document.querySelectorAll('.some-class');
```

---

**Example 3:** What about `$.ajax()`?

---

## Closing thought - Single Page App (SPA)

* A web app that interacts with the user by dynamically rewriting the current page rather than loading entire new pages from a server.
* The appropriate resources are dynamically loaded and added to the page as necessary, usually in response to user actions.
* Behaves more like a desktop application.
* The location hash or the HTML5 History API provide the perception and navigability of separate pages.
---

### Quiz

  [Solutions](https://github.com/appacademy/daily-quiz/blob/master/js/w6d4.md)

---

### Open Forum
