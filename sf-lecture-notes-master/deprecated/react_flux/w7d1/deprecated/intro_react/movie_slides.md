# Intro to React

---

## Overview

+ Intro to React
+ Anatomy of a Component
+ Rendering Components in the Browser
+ JSX
+ Transpilation with Babel
+ Grand Demo - Stopwatch

---

## Intro to React

+ created by facebook
+ front end JavaScript library for creating UI components
+ NOT an MVC, just the V
+ keeps a virtual DOM tree, then reconciles with the real DOM
+ intuitive, easy, and VERY fast - reconciling virtual DOM is efficient

---

## Why Learn React?
+ updating the DOM is the performance bottleneck traditionally
+ deciding which part of the DOM to update is a pain
+ never have to decide what or how or when to re-render

---

## Intro to React Components
+ Key building block of React application is the component
+ the view class

---

## Component Example

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
      React.createElement('div', {},
        React.createElement(
          'button',
          {onClick: this.click},
          "CLICK ME"
        ),
        React.createElement('span', {}, this.state.count)
      )
   );
  }
});
```
---

## Anatomy / Physiology of Components - props and state
+ created using `React.createClass`
+ props - attributes from parent components, shouldn't mutate
+ state
 + mutable data that affects rendered output
 + changes over time
 + owned by the component
 + usually changes due to user input
 + initial value returned from `getInitialState`, a life cycle method

---

## Anatomy / Physiology of Components - Render I
+ describes at any moment in time what component should look like
+ never explicitly called
+ a function (in mathematical sense) of props and state
+ changes to props or state induce a render
+ `this.setState({count: this.state.count + 1})` causes render
+ new props from parent also cause render
+ never have to wonder if view is up to date!

---

## Anatomy / Physiology of Components - Render II
+ returns single React element
  + single element can have any number of descendants
  ```html
  <div>
    <ul>
      <li>I</li>
      <li>Love</li>
      <li>React!</li>
    </ul>
  </div>
  ```
  + this has a single root: the `<div>`

---

## Anatomy / Physiology of Components - Events
+ handler set by passing prop
+ key name is: `onClick`, `onChange`, `onWhateverTheEventNameIs`
+ value is pointer to handler function
+ instance methods are auto bound to component instance
+ event handler function passed event object, just like jQuery event
+ event object contains target, current target, time, mouse location, etc

---

## Rendering Components in the Browser
+ need an HTML element, must exist on page
+ need to wait until DOM has loaded so we have a target to render into
+ `ReactDOM.render` will replace entire content of HTML element
+ *demo*: add click counter to DOM using `render`
  + click changes state and updates DOM accordingly

---

## JSX
+ conventional syntax for creating React elements
+ `React.createElement` tedious and unintuitive
+ comfortable with HTML, JSX is familiar and fun :)
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

## JSX
+ browser cannot natively understand, has to be transpile into raw JS
+ like erb in rails must be compiled into raw HTML
+ JSX: `<span>{this.state.count}</span>`
  + in raw JS:  `React.createElement('span', {}, this.state.count)`
+ can interpolate values using `{this.state.count}`
+ props passed like html attributes
    + `<button onClick={this.click}>CLICK ME</button>`

---

## Babel / JSX Transpilation
+ Babel: the transpiler!
+ need several node packages
  + `babel-core`
  + `babel-loader`
  + `babel-preset-react`
+ `npm install --save` - updates `package.json`
+ `node_modules` folder
+ babel preset to Webpack config
+ configure Webpack to run files ending with `.jsx` through the Babel loader
+ configure Babel (from within `webpack.config.js`) to use react preset so it knows how to transpile JSX

---

### END OF MOVIE SLIDESHOW
