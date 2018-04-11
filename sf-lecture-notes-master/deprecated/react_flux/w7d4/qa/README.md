---
## Solution Questions ##
---

# React Router #

---

## Overview ##
* Why do we care?
* Children Components
* Getting the router
* History
* Configuring routes
* Route matching
* Accessing URL/query params
* Navigating within React

---

### Why do we care? ###
* We want swap in/out some of the components upon user interaction
* We don't want separate entire React Applications for each URL - too slow
* We don't want to listen to the Fragment identifier - too complicated
* React Router will do it for you!

Note: Show demo here 

---

### Children Components ###
* So far we have been nested components inside the render method
* We can also add them when we create the component instance
* Ex: `<Parent><Child /></Parent>` 
* `Parent` element can read it's children through `this.props.children`
* How we actually make this happen dynamically based on user input using the router?

Note: Demo adding children to `App`, then render the restaurant, then add `Order` to restaurant
___

### Getting the router ###
* Not part of the React base
* Get it from a CDN
* Add it to our vendor assets and require it

---

### History ###
* React Router is built on a `history` object
* The history that ships with React uses the hash fragment and `?_k3489` stuff
* There are other histories better suited for production, that we will show you later

---

### Configuring Routes ###
* Get the component names at the top of the file
* Specify routes using JSX syntax
* Render the `Router` with the `routes` as children
* The router will put the correct component into `this.props.children` after
  matching the URL

Note: Demo simple routes
---

### Route Matching ###
* Nested routes creates nested components
* Use absolute vs relative path to change the URL
* Precedence
* Creating URL params

---

### Accessing URL/query params
* `this.props.params` for URL params
* `this.props.location.query` for query params
* Both of these return POJOs with the right keys and values

---

### Navigating Inside React ###
* Links - `<Link to="path/to/stuff">Link Text!!!</Link>`
* History mixin - sometimes `this.history` sometimes `this.props.history`
* `history.pushState(state, path, query`

---
