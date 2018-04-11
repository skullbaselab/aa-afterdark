# Notes!

### History of React

### Why are we learning React
* because deciding which part of the DOM to update is a pain
* because re-rendering everything normally gives us bad performance
* this stuff is effortless and fast with React

### What is React?
* JavaScript library for creating UI components
* NOT an MVC, just the V
* keeps a virtual DOM tree, then reconciles with the real DOM where
  necessary

### My First Component
* getting the library
* `React.createClass`, takes an object that must implement render
* `render` must return a React element
* `React.createElement`, takes type, props, and children
* third argument of children allows for building a tree
* JSX to create element trees instead of `createElement`
* `ReactDOM.render` takes a React element tree and an HTML element to
  render into
* attrs become `props`, kind of weird syntax. `className` for class

### Intro To JSX
* convenient syntax for defining tree structures
* not implemented directly, so if using you must have a library or
  COMPILE INTO REAL JS
* does the `createElement`ing for you
* not mandatory with React, but most often used cuz it's awesome

### Components with JSX
* JSX is not understood by browsers so we either need to compile it into
  real vanilla JS before it reaches the browser or require a transformer
* if you use the facebook transformer, write you JSX code inside
  `script` tags of type `text/jsx`
* JSX offers an alternative to the `React.createElement` method
* we pass properties in `React.createElement` as the second arg, pass kv
  pairs as a POJO
* in JSX we pass properties like they are html attrs, and they CAN be
  html attrs! Even event handlers! All will end up in `this.props`

### 5 practical examples


### Lecture Key Points
* `setState` causes render to be called again
* `getInitialState`
* state, props
* rendering again causes all nested elements to be rendered again, and
  that's ok!
* key functions are `React.render`, `React.createClass`, and
  `React.createElement`
* make a stopwatch, give it stop and start, then reset and split
* make the split subviews

make a stopwatch, first just a timer that goes on its own
use python `python -m SimpleHTTPServer`
then add buttons as a subview
