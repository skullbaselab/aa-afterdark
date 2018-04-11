# React Router

## Intro

### What does react router do for us?
- allows us to define our UI based on what we see in the URL bar
- allows us to jump to that view immediately by changing the URL bar
  - this means we can also send a link to a specific page to someone and they will see the same content

### How does it do this?
- provides us with components that can conditionally render depending upon what route we are visiting
- also gives us helper components to change the url bar
- similar to `react-redux`'s `Provider`, `react-router` gives us `Router`
- `Router` allows us to change the URL and get route params from it
  - route params work pretty much the same way as our route params in Rails
- `Router` uses React's `context` to give descendent components access to the router and it's methods

## Let's dig into the demo

### Introduce skeleton
- ...shows `index.html`
...

### `MyRoute`
- create our own `Route` component
- do it with `window.href`
- do it with `withRouter`

### Open the docs page

### `<Root>`
- Add `Provider`

### `<Header>`
- Add `Link` and `NavLink`s to header
  - **NB:** `Navlink` should take an `exact` flag to prevent 'Browse' and 'Best Cat' from both being selected

### `<App>`
- we want to conditionally render `CatIndex`, `CatShow` or `404`
- put in a switch statement with exact Routes for `/`, `/cats`
- `CatIndex` should work fine
- `CatShow` will break cuz props

### `<CatIndex>`
- add links

### `<CatShow>`
- update props to receive catId from `match.params`
- add `NavLinks` to `About`, `Friends`
- add routes for `About`, `Friends`
- add `Redirect` if no cat

### `404`
- render at end of `Switch`, but not in `Route` (that way we can use `withRouter`)
- get current path
- add a back to browse button
