# W6D3

### 1/17/2018

Lecuturer: Ned Ruggeri
Scribe: Stephen

## Questions:

* Are promises out-of-the-box JavaScript or is it a library?
  * In the old days it used to be libraries, but most modern browsers now support promises out of the box.
* So we can't use the method `reader.question` in a `for` loop because it's asynchronous?
  * That's correct.
* Is `resolve` a key word for promises?
  * Not quite, resolve is a parameter that the Promise constructor takes as a _callback_ to invoke when the promise is resolved.
* What is the `reject` parameter for?
  * It's for error handling when the async block throws some sort of exception. It passes the error to the `catch` block.
* Is it conventional to define error handling in `.catch` and not in the promise object itself?
  * Yes, because it's important for programmer flexibility when they use your promise object in unfamiliar contexts.
* (about `async/await`) - is transpiling always a viable option?
  * For any codebase that you have control over, yeah pretty much. I don't see a case where it wouldn't be a good idea. Maybe a small performance hit when translating your JS code into slightly older JS code?
* This might be out-of-scope, but how do you ensure that webpack doesn't show the line numbers from `bundle.js` and instead shows the proper filename?
  * I believe the webpack config we provide does this for you already, but honestly I'm not an expert in webpack configuration.
* Would you suggest making a new JavaScript file for each new element you want to create?
  * Yeah, it's not a hard and fast rule or anything, but in general I don't think it's a bad idea.
* You mentioned that `async` is just a keyword that says you can use `await`, can you speak more to what async is and how it works?
  * Yeah, the problem is older versions of JS used `await` for something else, so to prevent conflicts, the developers of JavaScript allow you to "opt-in" to using await as a keyword.
* So setting a const in an iteratior won't throw an error?
  * Yes! Keep in mind that `forEach` takes a callback, so each invocation of the callback generates a new const variable.
* Where in code is the cat's data being persisted to the database?
  * The ajax request hits the create method of the CatsController, which is where the data is persisted.

### 11/8/2017

Lecuturer: Kelly C.
Scribe: Jesse W.

## Questions:
+ Do the "success" or "errors" need to be callbacks?
  + technically no, it's just important to remember that the object is going to return one or the other
+ What is the "response" in all this?
  + it is whatever is passed into the success callback by the AJAX function
+ Is Ajax itself an async function or is what success/failure reuturns the async function
  + the Ajax function is the async part of the function.
+ When does .catch() run?
  + when the response gets logged, the catch will then return it
+ when writing the ajax request does the "method" need to be capitalized?
  + no

### 9/5/2017

Lecuturer: David D.
Notes: Dallas H.

## Questions:

* When you make a get request, are we not sending data? Do we need to set a 'dataType'?
  * We are not sending data, but you CAN set a dataType.
* Is a redirect treated as an error?
  * It can be.
* Are dataTypes case-sensitive?
  * Nope.
* Does it have to be a string?
  * Yep.
* Is `then` a keyword for promises?
  * Yes. It is a reserved method name for promise instances.
* It looks like you aren't doing anything to return a function. Is that built in to all functions?
  * We are assuming that `doSomething()` returns a promise object. `$.ajax()` returns a promise object.
* Can we create our own promises?
  * Yes. `new Promise()`
* With `catch()`, can we say something like `doSomething.then(successCB).catch(errorCB)`?
  * Yes. Just be aware that it will go to the first available error callback, whether in a `catch` or as the second argument to a `then`.
* Does a failure cause the whole chain to stop, or will the remaining `then`s continue to run?
  * Only if your `catch` allows it.
* Do you need to return a promise argument for every success callback in order to chain?
  * Yes.
* Will we use this today?
  * Yes.
* Will the promises be provided?
  * Yes, from JQuery. You might make one or two of your own.
* Does rails require tree in a specific order?
  * Not really. If you need a specific order, you should require your files manually.
* Can you make it return an error?
  * Yes! In fact, we do! We are console.logging the error.
* With the keyword data, does that mean that it is nested under { data : { trivium: ... } }?
  * Rails will see `{trivium: ...}`
* It's rendering JSON?
  * Yes. Anytime we return data to the view, we consider it a render.
* `appendTrivia` is getting it's data from `createTrivia`?
  * Yes!
* Does `$.ajax()` have a delete?
  * Yes. All of the http request types.
* If we didn't do an implicit return, what would we return?
  * We would have to explicitly return a JQuery response.
* Default dataType?
  * Rails says HTML

# w6d3

5/3/17<br>
lecturer: Shamayel

## yesterday

- nesting flex boxes in a grid system
  - not sure what you mean. applying display flex makes an element's
  children flexed
- what does display flex do?
  - children of the flex parent become flexed
- where do flex properties come from
  - they all are on the parent
- when is the next time we will css?
  - week 7 and FSP
- why would default flex be set to columns?
  - probably because the project creator wanted columns  
- what is the default usually?
  - it is row

## homework
- can data type be optional?
  - yes. you will see this later

## quiz
#### Q2

- would the url be the same as it would have been in the rails forms?
  - yes
  - we can set the request type in the ajax request
- ...
  - when we make a get request we can get data back
- are there times when we want to do an http request instead of an
ajax request?
  - no we use ajax requests now
- does that mean we will not re render the page?
  - we'll get to this later

#### Q4
- what is an http request vs ajax request vs json
  - the both send requests. ajax happens in the background

#### Q5
- is there a reason why you wouldn't want to put catch in the fulfilled
argument?
  - if you only wanted an error handler
- what's the difference between a web api and what we've been doing


## lecture
- on soundcloud, it looks like the url changes when I click on things.
how is it still a single page app?
  - you will learn about the router next week
- if there a difference between requests from rails views and ajax requests?
  - the setup
- for chat apps, are there like constant ajax requests?
  - websockets. look this up yourself during FSP
- we still need some kind of form for giving the ajax request data yes?
  - yes
- on the api request, there is a query parameter. what is that?
  - that is what this api wants
- question about promises and chaining promises
  - describes nesting callbacks, why one would want to chain
- success and error callback
  - yes, you can stick them on the end of the promise
  - we can chain forever instead of nesting forever
- when we use promises, do they go through the event loop?
  - yes. ajax is an async function
- is there a catch all for all errors?
  - not really
- do errors cascade?
  - not really
- is a reject callback like an error callback?
  - yes
- what is fetch comments?
  - a function that returns the ajax request
- more questions about success and error callbacks
- what can you do if you hit the fail and want to keep going?
  - you can chain stops in it
  - put error callbacks in the then
  - the chain might continue
- would those be considered executors?
  - I don't know. that language isn't used much

## demo
- did you have to set the data to json?
  - no it defaulted
- should we be writing fails into our projects?
  - it's a good idea. what if a user enters faulty data?
- how can you use response.fact?
  - console log things to test
- ... a question about success and error callbacks ?
  - jquery isn't set up to receive
- what is ${} ?
    - javascript string interpolation
- is there any way to use url shortcuts?
  - not the Rails ones. we're in javascript
- can you interpolate ruby into javascript
  - not really
- which url are we posting to? localhost?
- what type of object is res ?
  - it could differ, probably a javascript object

---

# W6D3

## 12/21/2016

### Lecturer Shamayel Daoud

### Yesterday's Solution Questions: a/A Times

* Something about modals?

### Homework questions

* It asked for an AJAX request - why are we logging before the AJAX and after it? Because log is sync but AJAX is not.
* General question and explanation of api keys - why didn't we need one last night?

### Quiz Questions

* Q3: Does that mean you can't *something something* status code.

### Lecture Questions

* If you have a then chain and everything up the chain is rejected, is everything after also rejected?
* What's the difference between done and then?
* If I put fail instead of then or done, would the request still be successful?
* When is something considered settled vs. pending?
* What's the difference between AJAX promises and ES6 promises?

### Demo Questions

* Why are we passing res into a `.then` that calls createTrivia instead of immediately calling createTrivia?
* When do we need to prevent default?

---

# Notes

### jQuery Fundamentals: Ajax
* asynchronous javascript and XML
* loading data from the server without refreshing the page
* uses browser's own XMLHttpRequest (XHR) functionality
* cross browser compatible code
* can pass it a config object
* `url`, `dataType`, `success` most important for `GET`
* `data` - query for `GET` body for `POST`
* `$.ajax` returns instantly
* X is for ajax - term coined in 2005, now JSON far more popular
* `$.get` and `$.post` also things
* `jsonp`, requests to other domains often prefer this type because
  normal XHR requests are forbidden. Instead it makes a `script` tag
  with a `src` of the URL to `get`. The response is a javascript function
  call that passes the data as an argument.

### Basic Ajax
* request in the background, no full page refresh


### Ajax Remote Forms
* serialize a form using `serializeJSON` or `$.serialize`
* authenticity token automatically included

### Underscore Templates
* script type `text/template`
* similar to ERB, `<%` and `<%=`
* call `_.template(templateCode)`
* `<%%` for templates within templates, so rails doesn't try to run the
  JS code inside while compiling ERB

# Demo

# AJAX
...the 'X' stands for JSON

ordering:
- server code, show api controllers
- navigate to routes to see json
- make a js file in assets to demo ajax requests
  - make vanilla js ajax requests (practice this)
  - make jquery ajax requests
- show how to use rails with this
  - talk about pipeline, application.js, header include tags
  - bind events on DOM elements to create/handle ajax requests
- make form first
  - on submit, create form data (don't forget to nest)
  - first, just console log, force a refresh to see new entry
  - next, append to lords container
  - then use underscore template to create html for lords container
- then make detail show on click of links instead of navigating to show
  - same process as form

## Asynchronous requests
- show them the server code (api controllers)
- navigate to routes that serve json (how do we get this data?)
- make ajax requests

### the vanilla js way
```js
var xhr = new XMLHttpRequest();
xhr.open('GET', 'http://localhost:3000');
xhr.onreadystatechange = function () {
  if (xhr.readyState == XMLHttpRequest.DONE ) {
    console.log(xhr.responseText);
  }
}
xhr.send();
```
### the jQuery way
```
// the jQuery way
$.ajax({
  type: 'get',
  url: 'http://localhost:3000',
  success: function(response) {
    console.log(response);
  }
});
```

### How to use it

Options
- url: where to make the request. Default is the page we're currently on.
- type: basically, the HTTP method (get, post, delete); default is GET.
- dataType: what format we expect the server response to be. The default is usually good enough, and we'll typically traffic in "json".
- data: an object that gets converted to a query string; this will come through in the params.
- success/error: callbacks to be run based on the status code of the response. Syntax:
- success: function (data, textStatus, jqXHR)
- error: function (jqXHR, textStatus, errorThrown)

## Rails projects with JS
Today we will use rails using asynchronous requests to deliver content.

Rails now will have 2 types of controllers:
- controllers that serve HTML to render pages synchronously
- controllers that serve JSON for asynchronous requests

### underscore templates
make script tags in DOM. Fill them with html with ejs tags. Grab the

### serializeJSON
Useful library that allows for easy serialization of forms.

### asset pipeline
Your javascript should live in your `app/assets/javascripts` folder. Rails will
then load all of these files by using the application.js file. This then gets included
in the header through the `javascript_include_tag`.

- application.js
- `javascript_include_tag`
- vendow/assets/javascripts

### success/failure
need to use `status: 422` to tell browser that request failed

### auth token
jquery-rails gem grabs it from the CSRF meta tag in the header.

hella fools be trippin on the fact that erb can't run on client side.
