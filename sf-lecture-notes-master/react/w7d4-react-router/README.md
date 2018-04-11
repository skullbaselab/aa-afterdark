# W7D4 
### React Router

---

## Lecture Agenda

1. Today's Material
1. Quiz Solutions
1. Flex Time/Open Forum

---

### Learning Goals

+ Understand the difference between static and dynamic routing
+ Become familiar with the React Router philosophy and its API
+ Understand how to integrate React Router with React/Redux

---

### Static Routing 

+ routes are declared as part of app's initialization before any rendering takes place
  + Rails backend routes follow this convention
  + All versions before React Router v4 are considered static routing
+ Also used in Node/Express, Angular, Ember.js, and more.

---

```js
app.get('/', handleIndex)
app.get('/invoices', handleInvoices)
app.get('/invoices/:id', handleInvoice)
app.get('/invoices/:id/edit', handleInvoiceEdit)

app.listen()
```

Note: This example is in Express.js

---

### Dynamic Routing

+ routes are now defined as a React component
+ routes are defined as the app is rendering, not configured before the app is run
  + if the component doesn't mount, the route essentially doesn't exist

---

### Okay, so what's the point?

---

![hold-your-horses](https://media.giphy.com/media/ysiWzvXGTEpTq/giphy.gif)

---

### React Router v4 Philosophy

+ Routes are a useful way to jump to a specific location in your app without having to navigate your site manually
  + Gives your React components access to the window's location and history
+ emphasis no longer on router, but on React
  + Routing shouldn't be a static configuration outside of React - they should just be React components
+ API small enough to remember without looking at the docs - you learn it once, you learn it all

---

## Fundamental API

---

### Router

+ BrowserRouter
  + HTML5 browsers
+ **HashRouter**
  + legacy browsers
+ MemoryRouter
  + testing + non-browser environment
+ NativeRouter
+ StaticRouter
  + server-side rendering
+ Typically lives at the top level of the React app (nested directly under `Provider`)

Note: MemoryRouter does not update the URL (useful for headless browsers and testing libraries), NativeRouter is for mobile apps, StaticRouter is for server-side rendering

---

```js
// Other imports omitted for brevity
import { HashRouter } from 'react-router-dom'

const Root = { store } => (
  <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
);
```

---

### Route

+ the building blocks of React Router
+ used to determine what UI to render when the location matches the route's path
+ a route ALWAYS renders - but when the location does not match, it will render `null`
+ path always starts with a `/`

```
<Route exact path="/" component={Home}/>
```

---

### Route (cont.)

+ `exact` property ensures the path is an exact match - as opposed to default behavior
+ three ways to render - only choose one
  + **component**: uses React.createElement to construct given React component
  + **render**: uses inline function to construct a React component
  + **children**: works like render, but gets called regardless of whether there's a match

Note: all render methods are passed Route props, with the exception of children if there's no match (match will be set to `null`) - this is primarily used if you want to override the default behavior - rendering

---

### Route Props

+ match
	+ represents how a route matched the current url
  + `params, isExact, path, url`
+ location
  + immutable JavaScript object that represents url's current state
  + `pathname, search, hash`
+ history
  + mutable JavaScript object
  + `push, replace, go(n), block(prompt)`

---

### Link

+ `to` property takes in string or object
+ Component that generates an anchor tag to a specific route
  + possible to do the same thing by installing an onClick handler on a `div` (`this.props.history.push(x)`)
  + more semantic / readable
  
```html
<Link to="/login">Login</Link>
```

Note: For non-relative links, requires a standard anchor tag `<a>`

---

### NavLink

+ NavLink is built on top of Link - adds `active` styling on the current link of set of links 
	+ Can be explicitly set with `activeClassName` property
  
```html
<NavLink
  to="/faq"
  activeClassName="selected"
  activeStyle={{ fontWeight: 'bold' }}
>FAQs</NavLink>
```
  
---

### Switch

+ Will only render the first matching route of the set of nested routes
+ Typically a good idea to render a `404` page or the equivalent in a catch-all route as the last nested route

```html
<Switch>
  <Route exact path="/" component={Home}/>

  <Route path="/users" component={Users}/>
  <Redirect from="/accounts" to="/users"/>

  <Route component={NoMatch}/>
</Switch>
```

---

### Redirect

+ `to` property takes a string or object to redirect route to
+ `push` property when present will push onto the history stack, not just replace current entry
+ `from` property can only be used within a Switch statement to redirect from one route to another

```html
<Switch>
  <Redirect from='/old-path' to='/new-path'/>
  <Route path='/new-path' component={Place}/>
</Switch>
```

---

### withRouter

+ analogous to the `connect` from `react-redux`
  + provides React Router props to the React-Redux component
+ required with Redux, because the `connect` function overwrites default `shouldComponentUpdate` behavior

```js
// This gets around shouldComponentUpdate
withRouter(connect(mapSTPs, mapDTPs)(MyComponent));

// This does not
connect(...)(withRouter(MyComponent))
```

---

### ownProps

+ Route props can be passed as an argument to mapStateToProps: `ownProps`

```js
const mapStateToProps = (state, ownProps) => ({
  currentId: ownProps.match.params.id
});
```

---

### Code Example

---

### Quiz

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/react/w7d4.md)

---

## Today's Project

[Pokedex Part II](https://github.com/appacademy/curriculum/tree/master/react/projects/pokedex/solution)

---

# Open Forum

---