# Notes

Resources I used in researching this lecture:

## DOM

* [DOM Spec](https://www.w3.org/DOM/DOMTR/)
* [Toy Rendering Engine]( https://limpet.net/mbrubeck/2014/08/08/toy-layout-engine-1.html)
* [How Browsers Work](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)

## Web APIs

* [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/API)
* [Document](https://developer.mozilla.org/en-US/docs/Web/API/Document)
* [Location](https://developer.mozilla.org/en-US/docs/Web/API/Location)

# Notes

* Intro to Web Apis
* What is a web API?
  * Application programming interface for web servers or web browsers
  * Client side API - used by application’s client side
  * Has javascript bindings
  * Allow your web apps to access browser things
  * Doesn’t include browser implementation details
  * Subset of web services that use REST conventions

* Intro to DOM
  * Document Object Model conceptually:
    * Can be implemented in any language so long as it satisfies the specs
    * a programming interface for HTML and XML documents
    * Defines a way that structure can be accessed from programs so they can change document structure, style, and content
    * Provides representation of objects as a structured group of nodes & objects that have properties and methods
    * Connects web pages to scripts or programming languages
    * A webpage is a document - can be displayed either in browser window or HTML source - same document with different displays. DOM provides another way to represent, store, and manipulate that same document.
* DOM is an object-oriented representation of a web page
  * Standards for most browsers
    * W3C DOM, WHATWG DOM
    * But some offer extensions beyond the standards
* DOM and JavaScript
  * Javascript uses DOM to access the document and its elements
  * DOM is not a programming language - just gives JS a model for webpages and elements
  * We use the DOM to access and manipulate objects
  * DOM and JS used to be tightly intertwined but evolved into separate entities
  * DOM designed to be independent of any programming language - can access with other languages as well.
* What is accessible to us?
* API for `document` and `window`
  * Data Types
  * Document - object of type document
  * Element - an element or node of type element returned by DOM API
  * document.createElement returns an element that has just been created in  the DOM
* Use DOM element interface and Node interface
* Nodelist - an array of elements
* Attribute - if you use createAttribute, get an object reference that exposes a small interface for attributes
* DOM Interface
  * Confusing because it uses a variety of interfaces?
  * Window is the browser, document is the root element of the document itself.
* Document is a part of window, has properties available to it
  * document.getElementById
  * document.createElement
  * Window.content
  * Window.onload
  * window.scrollTo
* Element inherits from Node. (Are there nodes that are not elements?)
  * element.innerHTML
  * element.setAttribute
  * element.addEventListener
HTML Interfaces
* HTML specification extends the Document interface - it is an abstract interface of the DOM that provides special properties and methods not present on a regular XML Document. All HTML elements are part of this extension of the DOM interface.
https://www.w3.org/TR/DOM-Level-2-HTML/html.html#ID-26809268

* Intro to History
  * History object
  * Contains URLs visited by user within a browser window
  * Accessed through window.history property
  * Language independent?
  * A history API is built into every browser
  * Window.history
  * Read-only property that returns a reference to the History object
  * Provides an interface for manipulating the browser session history
  * History object
    * Methods: Back, forward, go, pushState, replaceState
    * Properties: length, state
* In React
  * browserHistory uses History object - server must be ready to handle real URLs. Better for production apps.
  * hashHistory works for older browsers that don’t support HTML5 history API
  * Junk in hashHistory is “location state” data
  * Uses DOM API ‘window.location.hash=newhash’
  * We want histories to be able to access location state
* history.pushState(obj, text?, url)
  * Think of history as a stack
  * Will change url in url bar but won’t load the page or check it exists
  * Work with window.onpopstate
* history.replaceState will replace the most frame in the stack
* Window.onpopstate (js api?) (WindowEventHandlers)
“popstate” event is dispatched every time the active history entry changes between two history entries for same document (???) popstate event contains copy of history entry’s state object?
* Triggered by history.back()
* What can you do with history state?
  * You can get this in the event when you popstate
  * Can contain anything that can be serialized - saved to user’s disk in Firefox
* Each tab has its own history object
  * How is it pushState different than setting window.location?
  * New URL can be any URL in same origin - same document
  *  Window.location only keeps you at same document if you modify only the hash
  * Doesn’t force you to change the url to add a new history entry
  * Does not cause a hashchange event to be fired?
  * What does trigger a hashchange event is “location.hash = ldskfj”

* Event Propagation
  * Handlers work on parent even if you click on its child
http://javascript.info/tutorial/bubbling-and-capturing
  * Onclick goes to innermost element first, then “bubbles” up
  * Will bubble all the way to HTML if not caught!
  * You can stop event propagation with event.stopPropagation

# Reading notes

* target, currentTarget, delegateTarget
  * Problem - do we really want to add a new event listener every time we create a new followToggle? Not dry, too many event listeners.
  * target vs. currentTarget
    * currentTarget is what the listener is added to
    * target is the deepest element that something is triggered on - the element that generated the event
    * Can specify a delegate target - the below will only trigger when we hover over an li inside the cool-things ul. currentTarget is set to be the li, ul.cool-things is the delegate target, target is still whatever triggered the event
```js
$("ul.cool-things").on("mouseover", "li", event => {
    alert($(event.currentTarget).text());
  });
```
