# AJAX

---

Note: Ned gave this lecture last time, and his lecture notes and demo are located here: https://github.com/ruggeri/ajax-lecture

---
## Agenda

  * AJAX
  * Promises
  * Demo
  * Quiz Solution
  * Open Forum

---
## AJAX
* **A** synchronous **J** avascript **A** nd **X** ML
* Allows you to update a page without reloading it!
* Makes requests and receives responses in the background
* Lets us make "single-page applications!"

---
## AJAX continued

* Until now, every HTTP response has contained an entire HTML page which was then loaded by the browser.

* With AJAX, an HTTP response contains just raw data which is supplied to a callback

* "Client-side" (in the browser) javascript takes the response data and dynamically updates the existing HTML.

* Rails doesn't *know* you're making an AJAX request. It just operates as normal and responds with whatever you tell it to. (HTML or JSON)
---

## Data Formats
* Misleading name. You can use any data format, not just XML. Nowadays, JSON is the most common.
* JSON is nice because it's "lighter" and native to JavaScript (no need to convert data)

---
## History!
* Google was one of the first major companies to widely implement AJAX in Gmail (2004) and Google Maps(2005)
* Also 2004: Kayak.com's public beta used what their developers at that time called "the xml http thing"

---
## More History!
* 18 February 2005: The term "Ajax" was first publicly used by Jesse James Garrett in an article titled "Ajax: A New Approach to Web Applications
* 5 April 2006: W3C released the first draft specification for the XMLHttpRequest object.

---
### AJAX Fundamentals
```js
$.ajax({
  url: '/squirrels',
  method: 'POST',
  data: {
    squirrel: {
      name: 'Munchie',
      species: 'Flying'
    }
  },
  dataType: 'JSON',
  success: response => {
    console.log(response);
    console.log('Squirrel created!');
  },
  error: err => console.log(err)
});


```


---
### AJAX Fundamentls
* Only required key is `url`
* Possible `dataType`s: `xml`, `html`, `script`, `json`, `text`
---
### Promises
* Promises represent the eventual completion (or failure) of an asynchronous operation, and its resulting value.

---
### Old (Lame) Way
```js
function successCallback(result) {
  console.log("It succeeded with " + result);
}

function failureCallback(error) {
  console.log("It failed with " + error);
}

doSomething(successCallback, failureCallback);
```
---
### ...inevitably leads too
* Pyramid/Christmas Tree of Doom, Callback Hell
```js
doSomething(function(result) {
  doSomethingElse(result, function(newResult) {
    doThirdThing(newResult, function(finalResult) {
      console.log('Got the final result: ' + finalResult);
    }, failureCallback);
  }, failureCallback);
}, failureCallback);
```
---
### Fancy New Way
```js
let promise = doSomething();
promise.then(successCallback, failureCallback);
```
or even just
```js
doSomething().then(successCallback, failureCallback);
```
---
### Promise Chain
* Multiple callbacks may be added by calling `.then` several times, to be executed independently in insertion order
* The `.then` function returns a new promise.
* Each operation starts when the previous operation completes, with the result from the previous step
* Known as a **promise chain**
* A promise chain stops if there's an exception and looks down the chain for a `catch`
---
### Better solution!
```js
doSomething()
.then(result => doSomethingElse(result))
.then(newResult => doThirdThing(newResult))
.then(finalResult => {
  console.log(`Got the final result: ${finalResult}`);
})
.catch(failureCallback);
```
---

### `then` and `catch`


* `then` can accept two parameters
```js
p.then(onFulfilled, onRejected);
```
* `catch` only accepts one
```js
p.catch(onRejected);
```

---
### AJAX and Promises

* jQuery AJAX calls return a promise-like object (`jqXHR` object)
* Before jQuery 3, jqXHR's had a slightly different API than most/standard promises, but now jQuery is fully A+ compatible! 🎉🎉🎉
* Additional methods:
  * `done` => runs when the `jqXHR` object is fulfilled
  * `always` => runs when the `jqXHR` object is settled

---

### Demo!

---
## Quiz Solutions

  [Solutions](https://github.com/appacademy/daily-quiz/blob/master/js/w6d3.md)
