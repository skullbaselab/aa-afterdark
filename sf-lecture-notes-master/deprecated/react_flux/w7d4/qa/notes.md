# React Router #

## Overview ##
* Why do we care?
* Getting the router
* Configuring routes
* Route matching
* Accessing URL/query params
* Navigating within React
* History
* Index Routes

### Why do we care? ###
* We know how to make complex React applications with arbitrarily complex
  hierarchies
* But what if wanted to swap out some of the components upon user interaction?
* For example let's say we want to show the user's profile when they click the
  'Profile' button
* We could link to a new URL that would have our backend serve up a totally
  separate React application
* It would quickly become unmaintainable to have a different React app for each
  'screen'
* Also we would have to fetch new JS from the server every time we switched
  which would make our app less snappy
* Instead we could write an event listener for a change in the URL and then
  render a different component
* This isn't terrible, but figuring out which component to render with a
  complicated hierarchy like `/inbox/messages/compose` would become very
difficult
* The React Router will take care of listening to changes in the URL and
  figuring out which components to switch to and automatically swapping them out

### Getting the router ###
* Not part of the React base
* Download the JS file and add it to our rails app

### Configuring Routes ###
* Get the component names at the top of the file
* Specify routes using JSX syntax
* Then your top level React.render will render Router will the routes as
  children
* The router will put the correct component into `this.props.children` after
  matching the URL

### Route Matching ###
* Nested routes creates nested components
* Use absolute vs relative path to change the URL
* Precedence
* Creating URL params

### Accessing URL/query params
* `this.props.params` for URL params
* `this.props.location.query` for query params
* Both of these return POJOs with the right keys and values

### History ###
* React Router is built on a `history` object
* Newer browsers provide a history API so you can press back and forward without
  actually loading new pages
* React's history wraps around this API and shims it for older browsers
* Anything that complies with the history API that react specifies will work
* The history that ships with React uses the hash fragment and `?_k3489` stuff
* There are other histories better suited for production

### Navigating Inside React ###
* `this.history.pushState
* `<Link to>

### Index Routes ###
* Using InexRoute instead of Route is like root in rails
* If you want to create a

## Solution Questions ##
* Questions from pokedex

## Reading review ##
* Value link mixins demo
** `mixins: [LinkedStateMixn]` `valueLink={this.linkState('message')}`
* Small JBuilder demo
** `extract` `array` `!`
* Go over map demo

## React Router Part 2 ##
* Link `<Link to="/restaurants">Index</Link>`
* location.query `this.props.location.query`
* IndexRoute

## Final thoughts ##
* Warning about BenchBnb
