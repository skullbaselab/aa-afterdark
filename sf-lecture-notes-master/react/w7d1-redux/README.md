# Redux!
---

### But First!
# 5 min meditation

---

## Agenda

* A Brief History
* Redux Summary
* Code Demo
* Open Forum

---

![](https://media0.giphy.com/media/QLUE7bBjOJxe0/giphy.gif)

Note:
Before - This weekend, you may have been like, what is this Redux thing? Looks interesting?

---

![](https://media3.giphy.com/media/l4FGzcWoiddHwXQQg/giphy.gif)

Note:
Follow convention and let the magic happen around you

---

## You & Redux <3
![shaq](https://media0.giphy.com/media/uTvy5kvquPu36/giphy.gif)

Note:
But after some work, you and redux will be best buds

---

## Software Architecture

* A metaphor: Analogous to the architecture of a building
* Refers to the high level structures of a software system.
* Helps us reason about a software system.
* Comprises software elements, relations among them, and properties of both elements and relations.


Example: Flux

---

## Flux & Redux
### A Brief History

Why do we use them?

---

## MVC on the frontend

---

## AngularJS (2010)
## Backbone (2010)
## EmberJS (2011)

Note:
They all follow the MVC pattern in different ways.
There are some differences in how they manage changes to data.
[Angular manages changes](angular) through global scope variables.
Any view can change those variables, and when they do, a callback is called.
This callback can do multiple things, including change the DOM, call Model level functions, or update other global variables, therefore calling other callbacks.
 

[angular]: https://www.sitepoint.com/understanding-angulars-apply-digest

---

![mvc](https://cdn.infoq.com/statics_s1_20170411-0445/resource/news/2014/05/facebook-mvc-flux/en/resources/flux-react-mvc.png)

Note:
The difference of MVC between back end and front end:
  The back end is only concerned with updating the database, so future requests
  will contain the correct information. On the frontend, any changes to state
  may need to be reflected in multiple views and accounted for in actions.

---

## Enter React (2013) & Flux (2014)

+ Frontend application architecture
+ Unidirectional data flow
+ Both published by Facebook
+ Flux is _not_ specific to React

Note:
React was built to work with a Flux implementation.
It allows components to take in a completely new state and render that new state.
No back and forth communication between views and models.
React implements the View (render function) and has access to actions.
Actions and Reducers are kind of like a Controller.
_Actions_ set specific ways to update data and reducers change our state object.
AKA the API to our `store`.
Flux does not need models since the app state is kept in one big, organized object.
It adds data management with its goal of making data _changes_ easy and predictable.
The single, global source of truth that is passed to all subscribed, or `connect`ed, components after a change.
FB did a terrible job implementing its own version of Flux and has [basically been deprecated](https://github.com/facebook/flux/commits/master), it has only seen a dozen commits this year.

---

## Enter Redux!

+ Node package
+ Particular implementation of the Flux architecture
+ Simpler
+ Developed by Dan Abramov in 2015
+ Dallas has a ❤️/😠 relationship with Abramov
  + Ask him about automatic semicolon insertion (ASI) after lecture

Note:
Far and away the most popular implementation of Flux.

---

## Trade-offs for Redux

### Pros

+ Makes it easy to reason about complex data and UI changes

### Cons

+ Boilerplate code

Note:
Lots of boilerplate compared to just using React components.
React can certainly operate without a Flux implementation using local component state.

---

## When Is Redux a Good Idea?

+ Your data changes over time
+ You want to cache data in memory, but it can change while cached
+ Your data is relational and models include and depend on each other
+ The same data is assembled from different sources and can be rendered in several places throughout the UI.

https://medium.com/swlh/the-case-for-flux-379b7d1982c6

---

## Redux Principles

+ **Unidirectional data flow**
+ **Single Source of Truth**
  + Entire frontend app state stored in a single POJO
+ **That Source of Truth has a gatekeeper**
  + The only way to change the state is to dispatch an *action*
  + Actions tell reducers what changes to make to state
  + Updated state is sent to subscribed components

---

## Unidirectional data flow
![flux-unidirectional-data-flow](https://github.com/appacademy/sf-lecture-notes/blob/master/react/w7d2/redux-cycle-only.png)

---

## File Structure

+ Nest entire React app under frontend folder

---

## Store

+ Holds application state
+ With Redux, we only have one store

### `store` API

+ `createStore(reducer)`
+ access state: `getState()`
+ update state: `dispatch(action)`
+ register listeners: `subscribe(callback)` (`connect` with `react-redux`)

---

## Reducers

+ **Pure functions** that update state based on the `action`'s type
+ Returns either a new object with the updated state or the same state object
+ `rootReducer` combines multiple reducers into one using `combineReducers`
  + Every reducer receives every dispatched action but only their combined slice of state!

Note:
Reducers are a part of the store and help it update state

---

## State Shape

+ Entire *state tree* is a POJO
+ Each reducer corresponds to a key in the store's state
+ i.e. the structure of state tree is determined by reducers and their return vadlues

```js
// reducers/root_reducer.js
combineReducers({
  cookies: cookiesReducer,
  teas: teasReducer
})

// sample store.getState()
{
  cookies: [],
  teas: []
}
```
---

## Action Creators

+ Functions that return an action
  + an action is an object with a `type` property
  + may also carry a "payload"
+ Use action creators to dynamically create actions
  + abstract this logic out of components
+ Use constants for all 'type' values

```js
export const ADD_TEA = "ADD_TEA";

export const addTea = (tea) => ({
  type: ADD_TEA,
  tea
});
```

---

## Getting the State to Components

+ `Provider`
  + provides the store to the component hierarchy
+ `connect`
  + subscribes specific components to the state

---

## Components

+ Presentational
  + solely concerned with rendering jsx as product of props
  + may or may not have a corresponding container

+ Container
  + subscribes the component to the redux store via `connect`
  + provides relevant slices of state to component
    + `mapStateToProps`
  + provides functions that `dispatch` actions to presentational component
    + `mapDispatchToProps`

Note: 
+ mSTP and mDTP are not required names, they are just callbacks that determine
  the parts of state and particular dispatch actions that a component have
  access to. `connect` will handle passing the `state` into the first callback,
  `dispatch` into the second, and combining the returned objects as the `props`
  for the presentational component that is connected!

---


## Selectors

+ Helper functions that pull out specific pieces of state
+ Typically used in containers
+ Add to selectors.js file in reducers folder

```js
// reducers/selectors.js
export const selectTeaByType = (teas, type) => (
  teas.filter((tea) => tea === type)
)

// components/tea_list_container.js
const mapStateToProps = state => ({
  greenTeas: selectTeaByType(state.teas, "Green")
});

```

---

![redux-unidirectional-data-flow](https://github.com/appacademy/sf-lecture-notes/blob/master/react/w7d2/redux-cycle-only.png)

---

#### Let's see the redux cycle in action!

---

## Thanks!

