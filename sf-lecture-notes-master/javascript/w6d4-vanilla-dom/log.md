## January 18, 2018
Lecturer: David Dobrynin
Scribe: Cynthia Ma
Topic: Vanilla DOM
Music: Ice Ice Baby by Vanilla Ice

### Lecture Questions
+ How does the event listener stay active if the element has been removed?
  + Even if you delete the element, it doesn't mean that every event was removed.
  + If there is still a reference to the deleted element, the event will still be active.
+ What if the handler is listening to something different things?
  + Handler and listener mean the same thing.
  + Event STARTS at the most specific div. Then, all other events bubble up.
+ Can you install multiple event handlers on the same DOM element?
  + Yes, they do not override each other.
+ When have we used DOM before?
  + As soon as you send up a document, it uses the DOM internally.
+ Do the privacy settings for clear history effect this?
  + This is the history of this tab, not the browser.
+ What does navigating through the session history?
  + I'll show you!
+ What can websites can and cannot do to the history?
  + You have access to the length and navigating them.
  + You can not READ the websites they were at.
  + They store the pointers, not the actual websites.
+ When you go back and forth on the history. Is it accessing through the cache?
  + Don't think so.
+ Is the event handler on the hash change how react router works?
  + Not sure, but I would not be surprised if they did.
+ When you load a website, do you have to load the libraries?
  + Yes.


### Code Demo Questions
+ Is the current target predictable?
  + When you are install handlers, you want to to know what element you,
  + current target: where you install the handler is installed.
  + target: where the event happened.
+ Is it more efficient to add the event handler on the capture phase?
  + Not sure if its efficiency, its probably a logic flow.
  + You can stop event propagation.  

### Quiz Q's and Open Forum
+

### Immediate Action

### Suggestions

### Feedback for Lecturer

# W6D4 Log
## 11/9/17
+ what is a "node" exactly?
  + in a conceptual sense, really just one element in this conceptual tree of elements on the one page. similar to any node from our dfs /bfs days. In this "DOM" context, they are mostly referring to html elements.
+ How does "delegate target" fit into this model?
  + "delegate target" is specific to jQuery, but it allows you to take the node and specify a tag for all the children nodes and install an event listener for each of them
+ how can you send someone back if you don't know/have access to the url?
  + we could just say go back x number of sites and we send the person there, but we can't see where that was
+ In this context of location and history, how does incognito browser work?
  + Not sure. incognito likely still has a use for most of these things (ie, you can still go back a page in an incognito browser), but the usage of cookies probably changes and some of the functions in these browsers might be less functional.
+ what are some of the use cases for this?
  + redirects are pretty usefull sometimes, but it can be a little old fashioned. There used to be lest flexibility with manipulating the DOM, but it is the same outcome as redirecting from your router just from the client side.
+ does the "back" button use the same session history as history.back? and if so, how is this affected by location.replace
  + if you were to go back after that location has been replaced, then the back would take you to the new location
+ the source is going to be the same inside the dev tools correct?
  + yes, only the elements nested within the root div will change.
+ What is happening in that "switch" statement?
  + it is just the same as a case, when statment from ruby



## 9/7/2017

# W6D4 Lecture

-- Lecturer: Kelly :)
-- Scribe: Hope

## Lecture Questions

* What's the capturing phase?
  * When an event fires, we need to start with the topmost node and
  notify every node on the chain up that the event has been triggered
* So Phase I (Capture) - III (Bubbling) happen after click?
  * Yes
* Will this happen regardless of where event listeners are installed?
  * Yes
* The jQuery script link is from Google APIs, can you use that in any browser?
  * Yes, it's just a file sourced from elsewhere.
* What does $().click() do?
  * jQuery’s .click() method is shorthand for BOTH .on( “click”, handler )
  AND .trigger( “click” )
* What is XML?
  * eXtensible Markup Language
* What is XMLHttpRequest.send actually doing?
  * This function actually sends off the request.
* Where would you set something like Content-Type?
  * You would do that after calling XMLHttpRequest.open() but before
  XMLHttpRequest.send(), and use XMLHttpRequest.setRequestHeader().



## 5/4/2017

# W6D4 Lecture

-- Lecturer: Jenn
-- Scribe: Luke

## Lecture questions

* Does this apply to all descdents, or just direct descendents?
* When we use delegation, is the `currentTarget` the inner selector?
* It looks like the `currentTarget` should be the inner, not the middle?
  * Delegation sets the target to the `currentTarget`?
* Will target allways be `currentTarget` when we delegate?
* What if there's another element inside thirdInnerDiv?
* What's the difference between `getElementById` and `querySelectorAll`?
* Where does history take us if we keep hitting "back"?
* Can we push stuff onto history?
* Is XMLHTTP constructor allways included?
* Why use jQuery?
* Layout vs. styling?
  * So, styling is our CSS, and layout comes from the browser?
* Will setting visibilty hidden change the layout?
* How does the browser link styling with the DOM tree?
* How often does the browser re-render?
* Does the browser use special algorithms to render things this fast?
* How is it a single-page app if we change the location?
* When does a change cause to whole page to be repainted?
* Hash params in the URL, why?
* What does the hash mean in the URL?
* Are we tricking the user?
* When is stuff recreated?

## 12/22/2016
Lecturer: Gage Newman

# W6D4

## 12/22/16
Lecturer: Gage Newman
Scribe: Quinn Leong

### Questions from Yesterday

- Silence.
- Gage is "dying to talk about AJAX syntax".
  - Q: Is there a time we would explicitly not want to include the `dataType` key?
    - A: Not really. There's nothing to lose by including it.
  - Q: What is the default data type?
    - A: Depends. For a request, it's HTML. For submitting data, it looks at the data uploaded
      and matches it.
  - Q: Something I couldn't here about why we use promises???
    - A: Promises are cleaner for having multiple things happen on success. We can chain them
      rather than nesting them in one single success callback included in the object passed to
      `.ajax()`.
  - Using arrow function vs `function` keyword function with `this` in click listener
    - Arrow function sets `this` to `window`; `function` keyword sets `this` to the target
  - Iterating through a jQuery collection gives you HTML elements, not jQuery objects.
  - Q: Are jQuery collections actually arrays? Or just array-like?
    - A: You get to answer this yourself while making jQuery Lite today!

### Today's Material

- Gage asks how many people did the reading and HW. About 1/4 of people raise hands.
- Gage asks how many people studied for the assessment instead. About 3/4 of people raise hands.
- Gage says we're moving pretty quickly through this. Ask questions if you want,
  but I might tell you to do the reading.

### Web APIs

- Gage scrolls quickly through a massive list as proof that there are many web APIs in existence.
- Gage shows how you can add a listener to a parent and it will still react to events on
  children that are appended after the listener is added.
  - Q: Does it only work for children one level down?
    - A: Check the docs, but probably matches no matter how deep.
  - Q: How exactly is this event handling thing working?
    - A: That's a deep question. Be autodidactic and read the docs for more info.
- Gage shows the cool features of having a `document`.
  - `document.designMode = "on"` means you can edit the webpage ON the webpage. WHAT.
  - lots of other cool random things defined on `document`.
- Gage talks about what features `history` has.
  - It's a stack. We cannot rewrite time in a non-linear fashion.
  - `history.pushState` demo
  - Q: Does it show up in the browser's history?
    - A: Gage clicks on the page in Chrome's history list, then asks, "Did clicking on
      that answer your question?"
- Gage talks about `location`.
  - Demo of `hashChange` listener.
    - "hashtag hashchange"
  - Shows how old school web used `hashChange` to scroll to a specific section; shows
    this still in practice on Wikipedia.
- XML HTTP Requests
  - Doesn't have to be XML and doesn't have to be HTTP.
  - Gage shows how to create an XHR.
  - Q: Can't hear, but seems to be about AJAX vs XHR.
    - A: AJAX is kind of a nice wrapper around XHR.
- Gage talks about why jQuery is useful.
  - Standardizes across browser differences.
  - Pro: Lots of companies still use it, common in interviews.
  - Con: Heavy library and we could do everything with vanilla JS.
  - Shows how jQuery makes things simpler/more concise than the vanilla JS way.
- #The Future
  - #SPA (single page apps, not bath spas)
  - Gage demos a basic SPA.
    - Gage rallies everyone around being sick of cats by this point in the curriculum.
    - Gage shows a photo of a rabbit the size of a border collie.
    - Gage shows a photo of a cat wrapped as a burrito.
    - Content always swapped in and out, no page reloading.

### Browsers

- Gage explains all of how a SPA works with a great diagram.
- The first request returns HTML, JS, CSS. Subsequent requests just return JSON data.
- Gage distinguishes between SPA diagram and the only-rails diagram.
  - Q: Does the initial view still come from rails MVC?
    - A: Yes.
  - Q: How does this work?
    - A: We write one controller that serves our single HTML view. All other
      controllers just serve data.
- Gage explains what a browser is.
  - Walks through a diagram breaking down the different functionality
    that makes up a browser.
  - Walks through each part of a browser and how it works.
  - Student knocks over a giant plant while going to the restroom, then tries
    to clean up the spilled dirt with a single paper towel.

### The DOM
  - The tree consists of parsed HTML nodes.
  - Standards and specs are set and maintained by a couple of organizations.
  - Describes in detail how the rendering process works and optimizations made
    to speed up re-rendering.

### Yesterday's Quiz

- `target` is the element that generates the event; `currentTarget` is the
  element that "cares about" the event.

# W6d5 Log

## 10/20/2016
Lecturer: Kevin McCall

### Notes
- Making fun of the interview pictures made for good engaging laughs

### Asked Questions

- If you put a listener on the outer element are there listeners on the middle and inner elements?
- Is the target that most nested element we can reach?
- Is an event dispatched regardless of whether we have listeners?
- If we change the event delegation to OUTER, will it also work?
- Why is Internet Explorer so bad?
- If we’re interacting with the render tree how are events mapped back to the DOM tree?
- How much can I mess up HTML without it correcting me?
- Can I have different views of my application state of single page app and make back button just go back in time in my app?

## 8/19
Lecturer: Brooke

### Asked Questions

  * What are jbuilder files? Why do we want a json response?
  * Adding event listener to `document` vs specific elements
  * Why even bother changing the hash instead of just manipulating the DOM?
  * Difference between `location.hash` and `history.pushState`
  * What's the benefit of a one page app if we're simulating history anyway?

### Notes

  * Take out underscore from ajax twitter?
  * New microphone is awesome

### Other Notes
  * Brooke's last lecture ever, MISS YOU ALL!!! <3 <3 <3
