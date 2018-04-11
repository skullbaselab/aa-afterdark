# W7D1 - React

---

## Overview
+ Intro to React
+ `React.render`
+ Components
+ JSX
+ Events
+ API Summaries
+ Demo

---

## Intro to React
+ intuitive, easy, fast
+ JavaScript library for creating UI components
+ NOT an MVC, just the V
+ keeps a virtual DOM tree, then reconciles with the real DOM

---

## Why Learn React?
+ because deciding which part of the DOM to update is a pain
+ because re-rendering everything normally gives us bad performance
+ this stuff is effortless and fast with React

---

## Getting Started / React.render

```
React.render(<div>React!</div>, document.getElementById('some-div'))
// or
React.render(React.createElement('div', {}, "React!"), document.getElementById('some-div'))
```
+ get the library: `https://fb.me/react-0.13.3.js`
+ add a container (a `div` or whatever) with an `id` for React to render into
+ only one `React.render` for entire _tree_ (one root but infinite children)
+ doesn't modify container, but replaces all contents

---

## Component
+ the view class
+ created using `React.createClass`
+ pass in an object, kv pairs become instance methods
+ never need to `new MyComponent`, JSX or createElement
+ MUST implement render

---

## Component Example

```
var ClickCounter = React.createClass({
  getInitialState: function(){
    return {count: 0};
  },
  render: function(){
    return (
    React.createElement('div', {},
      React.createElement(
        'button',
        {},
        "CLICK ME"
      ),
      React.createElement('span', {}, this.state.count)
    )
   );
  }
});
```
---

## JSX
+ XML like syntax for describing trees where each node has attributes
+ usually compiled into raw JS on server or transformed on client, but don't
+ in React it compiles to `React.createElement` trees
+ interpolate functions and values using `{this.state.name}`
+ no if else within JSX block, make vars or ternary
+ attributes will become `this.props`
```
<div>Yay</div>
//vs
React.createElement('div', {}, "Yay")
```
---

## Component With JSX

```
var ClickCounter = React.createClass({
  getInitialState: function(){
    return {count: 0};
  },
  click: function(event){
    event.preventDefault();
    this.setState({count: this.state.count + 1});
  },
  render: function(){
    return (
      <div>
        <button onClick={this.click}>CLICK ME</button>
        <span>{this.state.count}</span>
      </div>
    );
  }
});
```
---

## Component Cont.
+ no need to `bind`, instance methods automatically bound
+ several 'lifecycle' methods, `getInitialState`, `componentWillMount`, et.al
+ main instance properties: `this.state`, `this.props`
+ props - attributes passed in during creation
+ state - how does it change within its lifetime?
+ can also use instance variables
+ most components won't have state

---

## Component#render
+ don't have to call, changes to `this.state`/`this.props` trigger automatically
+ `this.setState({count: this.state.count + 1})` causes render
+ returns single child (with any number of grandchildren / any depth)
+ should be a function of `this.props` and `this.state`
+ common to use `map` for arrays of children
+ never have to wonder if view is up to date!

---

## Event Handling
+ `<span onClick={this.handleClick}>Click Me</span>`
+ `onXXX` property where `XXX` is a JS event name
+ value is some method to be invoked
+ instance methods are auto bound
+ passed a synthetic event, behaves identical to jQuery event handling

---

## React API Summary
+ `React.render(<MyComponent/>, document.getElementById("my-container"))`
+ `createClass`
+ `createElement` or jsx

---

## Component API Summary
+ `this.props`
+ `this.state`
+ `render` called automatically when `setState` or new `props`
+ `componentDidMount`, `componentWillUnmount`, etc
+ `this.setState`
+ `getInitialState`

---

## JSX API
+ `<CoolComponent name={inScopeVarsHere}/>`
+ how to set `props`
+ event handlers, `onClick`, 'onMouseenter'

---

## Demo
+ stopwatch
+ `python -m SimpleHTTPServer` and `index.html`
