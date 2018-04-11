# Redux Day 1 Lecture Prep

## Reading Resources

[Flux Architecture Video](http://facebook.github.io/flux/)

1. Very useful when multiple actions can update the same piece of information
2. Video is by a FB dev who gives the example of "unseen message counts" as
    more features were added that interacted with the count.

[Presentational and Container Components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0) - Dan Abramov

1. Presentational vs. Container components
  + Presentational are solely concerned with how things look. Stateless unless
    UI state is needed
  + Containers provide the data and behavior to presentational comps
  + Why? Separation of concerns
2. When we need containers
  + Threading through components that don't use the info
    + Terrible to maintain, multiple sources of errors, and need to change
      multiple components when a deeply threaded component needs new/other data
3. Class vs function components
  + Functional components are simpler to define, but do _not_ give us access to
    local state and lifecycle hooks. 
4. Tendencies
  + Presentational componeents _tend_ to be stateless pure functions
  + Containers _tend_ to be stateful pure classes

[When To Use Redux](https://medium.com/@fastphrase/when-to-use-redux-f0aa70b5b1e2)
1. Same piece of application state needs to be mapped to multiple container
  components. Example: session
2. Global components that can be accessed from anywhere. Example: main section
  that shows notifications, tooltips, modals, interactive tutorials, etc.
3. Too many props are being passed through multiple hierarchies of components.
  Example: A component is passing down 12 props but only uses 2 of them itself.
4. State management using setState is bloating the component. Example:
  Subjective, but when too many portions of a component rely on setState()
5. Caching page state. Example: holding a search input value when a user goes
  back to a certain page. Could be held in the backend, but that much info
  starts to be too much to keep on the backend.

Some personal input: Just about any app worth using will eventually contain a
few if not all of the above. Might as well plan ahead!

[You Might Not Need Redux](https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367) - Dan Abramov

[The Case For Redux](https://medium.com/swlh/the-case-for-flux-379b7d1982c6)

1. If your data changes over time. The point of Flux is to make data changes
    easy to reason about. You don’t need Flux if you don’t care about
    immediately reflecting changes in the UI. A new feature could also change
    how all of this info has to be managed, changing it anywhere that model is
    being accessed.
2. If you want to cache data in memory, but it can change while cached. Can
    save things like items in a list when moving to a detail view, scroll
    position, etc. Also need to account for changes to those items from the
    detail view.
3. If your data is relational and models include and depend on each other. A
    single button press needs to be reflected in the follower count, followee
    count, the text of the button.
4. If the same data is assembled from different sources and can be rendered in
    several places throughout the UI. Liking a post has to update the count,
    a view of most recent likers, and a sidebar


[Video](https://www.youtube.com/watch?v=p8tqhf5qKOI)
+ Each "view" is rendered with a completely new set of information. It doesn't
depend on deltas within the app (eg: the follow button)
+ Data manipulation only happening in one place

## Preparing for Lecture

## Topics Covered in Readings/Materials
+ Flux architecture
+ Redux as an implementation of Flux
  + Actions
  + Reducers
  + Store/State
  + `Provider`
  + `connect`
  + Selectors

## Topics Covered in the Homework
+ Dollar Store app - simple app from lecture yesterday using Redux. Using:
  + `subscribe`


## Important Points

+ Why should reducers be pure?
  We want our state to be immutable so we can easily check if the state has
  been altered. When we have update state, we have completely new state POJOs.
  We can do a shallow check of each object to see if `prevState === newState`
  to know if there were any changes!
+ `redux` gives us the general functions for `redux` that don't depend on other
  frameworks being used. `react-redux` package gives us tools to integrate
  React into Redux.

## Preparing to Lecture

## Lecture Notes

