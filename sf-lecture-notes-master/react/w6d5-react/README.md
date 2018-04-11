# React!

---

## Agenda

+ Morning Meditation
+ Quick NPM demo
+ React Material
+ React Demos
+ Quiz Review

---

## Meditation

---

## NPM and webpack demo

+ NPM is a package manager and software registry
+ Similar to `gem` in ruby, except the packages are saved local to the project
+ `package.json` === `Gemfile`
+ Yarn is an alternative that stores packages in one location
  + Google and FB have recently switched to yarn, but NPM is way more popular

---

## React

+ Frontend library for creating UI components
  + It is the V in the frontend MVC
+ Created by Facebook in 2013
+ Pairs a virtual DOM with the actual DOM to determine what should be changed

---

## React Component

+ Returns virtual representation of HTML Elements (& child elements)
+ Single Responsibility Principle
+ Pure function

```js
class MyComponent extends React.Component {
  constructor(props) { // this implementation is implicit!
    super(props);
  }

  render() {
    return (
      <h1>Hello!<h1>
    );
  }
}
```

Note:
[Pure functions](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-pure-function-d1c076bec976)
  + Has a deterministic output based on the input
  + Produces no side effects

This is the default `constructor` method, do not need to always write it.
This is just to show what it is. Only need to overwrite for binding methods or
creation of local state.

Defining a `render()` method is required.

---

### Using a React Component

```html

<MyComponent /> // instantiation

```

---

### Local State
+ Explicitly created in the constructor
+ Referenced by `this.state`
+ Do not modify `this.state` directly!

```
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }
  // ...
}
```

Note:
`setState` runs asynchronously, so make sure to run anything depending on it in
a callback!

---

## `this.setState`

+ Runs _asynchronously_
+ Function signature
  + the object that will be the new state
  + The callback that is called after the new state is set

```js
this.setState(newState, callback)

// merge new state with current state
this.setState(Object.assign(this.state, newState), callback);
```

---

## Props

+ Passed to the component when it is instantiated
+ Referenced by `this.props`
+ **Do not** store parts of `props` in `this.state`
  + They should not contain the same information
+ For now, a component can't directly change its props
  + We will be able to do this on Monday with Redux

```js
<MyComponent name="Aaron" />

// Somewhere in the component
this.props.name; // => "Aaron"
```

Note:
Don't store props in state because props will already trigger lifecycle methods
Will be explained in the next slide

The inputs into the React pure function are `props` and `state`. Any changes to
how the component looks should be performed by changes to `state` or `props`.

---

## Lifecycle Methods

+ Mounting
+ Updating
+ Unmounting

Note:
In an ideal world, we wouldn’t use lifecycle methods. All our rendering issues
would be controlled via state and props.

Use these methods sparingly when you need more control over how your component
updates.

---

## Mounting

+ `constructor()`
+ `componentWillMount()`
  + Not very useful
+ `render()`
+ `componentDidMount()`
  + Here is where we will call our AJAX requests!

Note:
We do not want to cal AJAX requests in componentWillMount because we can't
guarantee that our component will mount before the request resolves. This would
mean `setState` could be called before we even have a component with state!

---

## Updating

+ **`componentWillReceiveProps()`**
  + Receiving new props starts here
  + Act on changes to particular props and set new state accordingly
+ **`shouldComponentUpdate()`**
  + `setState()` starts here
  + The default is `return true;`
  + Stop renders in certain cases of changed props
+ **`componentWillUpdate()`**
  + Pretty useless for the most part
+ **`render()`**
+ **`componentDidUpdate()`**
  + Also pretty useless

Note:
We might want to stop a re-render if our props change but the props that did
change do not directly influence what is being rendered. Say, some background
data.

---

## Unmounting

+ **`componentWillUnmount()`**
  + Remove event listeners, etc

Note:
These methods are called in this order and we can overwrite them to have certain
actions taken when things happen.

---

## Reconciliation

+ The virtual DOM
+ `render()` vs `render()` for new `state` or `props`

```html
<button class='button button-blue'>
  <b>
    OK!
  </b>
</button>

{
  type: 'button',
  props: {
    className: 'button button-blue',
    children: {
      type: 'b',
      children: 'OK!'
    }
  }
}
```

Note:
The virtual DOM is a javascript representation of the actual DOM.

React will call the render function with new `state` or `props` and compare it
to the current representation in the virtual DOM.

Quick note about the diffing algo (see `lecture_prep.md` for articles on this
+ If the `type` is different (`button`, `div`) it does a full re-render of that
portion of the DOM
+ If the `type` is the same, it does a diff of the keys and only updates the
parts that changed, then recursively diffs the children

---

## Class vs Functional Components

Stateful vs Stateless Components

```js
class Button extends React.Component {
  // remember, implicit constructor
  render() {
    return (
      <button className="{this.props.className">
        {this.props.text}
      </button>
    );
  }
}

const Button = (props) => (
  <button className="{props.className}">
    {props.text}
  </button>
);

```

Note:
We want to prefer functional if possible. They are smaller and faster.

---

## When to use Stateful

1. Want to use lifecycle hooks
2. Want to keep a local state
  + forms
  + ui changes not handled by parent component

---

## React Demos

+ Happy Friday Widget

---

## Currency Widget

#### Thinking in React

---

Overview/Entry

![Overview and Entry](https://i.imgur.com/kDcieor.png)

---

Widget

![Widget](https://i.imgur.com/CXUstqA.png)

---

Index Component

![Index](https://i.imgur.com/btHwKrR.png)

---

Items Component

![Items](https://i.imgur.com/nkErBqH.png)

---

# Let's build this.

---

## Quiz

+ [Solution](https://github.com/appacademy/daily-quiz/blob/master/react/w6d5.md)

---

## Cool.

