# W7D4

### January 25, 2018

Lecturer: Stephen Pangburn II
Scribe: Ryan Mease

1. Is this like for a single page but because you know that's like different to the way we've been doing it up to this point? 
  + Yes, that is correct
2. Is it like a certain URL synced with certain states? 
  + Yes and no; certain components will conditionally render, but they are not necessarily tied to changes in state 
3. So when we did all of these renders, if we didn't have a view, what would happen? 
  + It would render null, but it would appear in the search bar as a path
4. Do you use render to give you component props inside of a component? 
  + I believe that render takes props as an argument
5. Do we pass props to the function as a parameter and that allows us to pass it to the component?
  + I will have to get back to you 
6. I have heard that render() is slower than (??) is that true? 
  + I will have to get back to you 
7. Is this similar to how reducers look for a match? 
  + This is a similar pattern with the opposite approach: it finds the first match and returns it, rather than checking all reducers and impacting the relevant ones 
8. Does params work that it does in Rails? Do we just key into params? 
  + Yes, more or less 
9. What else other than the colon is a wild car? 
  + Nothing; the colon is the wildcard
10. Is there a reason that the path isn't included in the Red component itself? 
  + Yes, if we use that pattern, it wouldn't render 
11. Is the switch statement necessary? 
  + Is not necessary in this case because all of these routes are mutually exclusive
  + You will see in the next part of the demo why it becomes valuable 
12. Would an empale of when we would use this be when we have an incorrect login? 
  + We'll just display the errors on the current page 
  + Let's say that we aren't logged in and we want to go somewhere that only logged in parties can visit—we'll need to redirect
13. What about the redirect helper in our controllers? 
  + You're referring to the redirect function inside of Rails
  + Redirect in Rails has two applications: serve a different page
  + Rails will also send the user to a root page, but we're always on the root page in React

### November 16, 2017

Lecturer: Stephen Pangburn
Scribe: Kelly Chung

### Lecture Questions

1. Couldn't we just keep going back using the `go` method and recording
where we're going every time to record the history?
  + You can't use it to navigate your user's history because every
  user's experience is unique
1. If you use the `NavLink` do you still have to specify the CSS to make
it active?
  + No, you don't need to. You can specify further inline styling though
1. If we don't have `Switch`, will it render multiple routes?
  + Absolutely. It would render all components that match
1. If you use a `Switch`, can you put routes outside of it?
  + Yes, you can have routes outside of the switch
1. Will `Redirect` refresh the page?
  + Nope, it will just change the URL and the routes will conditionally
  re-render
1. For the redirect `from` property, it needs to match the browser's
current location?
  + Only if you want it to redirect
1. How would nest routes under a certain path defined?
  + Will demonstrate in code demo. TL;DR it will be nested in the
  rendered component
1. When do we have to think about `withRouter`?
  + Just when you're defining container components that you want to be
  responsive to changes in the route
1. When would you use a NavLink vs a Link
  + When you have a set of links that you want to differentiate between
  using CSS

## Lecturer: Kelly
### September 14, 2017
### Scribe: Stephen

##Questions
### Presentation

+ What libraries are considered better for mobile? (Instead of React Router)
  + The AirBnB navigation library, and also Facebook's community does endorse another particular solution I believe, but I don't have specific React Native experience. Do note that on mobile, it is referred to as "navigation" instead of "routing"

+ What is the relationship between `match` and `location`? In the homework `match` was nested under `location`.
  + There can certainly be overlap, but these are just parameters provided directly by the React Router props. They don't have a direct relationship.

+ Can you change the default CSS tags for the anchor tags?
  + Yes, I believe the property is `text-decoration`.

+ In a lot of full-stack projects, an expected functionality is demo login, is that done using `this.props.history.push`?
  + You certainly could, but usually it's really done using some sort of demoLogin function. That may involve pushing to history, but not necessarily.

+ Can you give an example of the wildcard url?
  + (The answer was kind of hard to transcribe.)
    + Does it matter if the value in the url actually reflects the variable name?
      + No, that is not the job of the router. It is up to the components themselves to verify the input.

+ So the ordering of React Router's `Switch` is akin to a switch statement?
  + Yes

+ Is `NoMatch` a defined component in React Router?
  + It doesn't seem like it, but I'll look into it some more.

+ Do the frontend routes have to match up with the backend routes?
  + Technically, no, but if you want to be nice to your fellow developers, then yes.

+ Can you have a browser router and hash router, and load the optimal router based on the browser environment?
  + Probably the best way would be to import `as Router`, and set a conditional in the import statement using a media query of some sort.

+ Is there an advantage to Redirecting at certain times?
  + React Router's redirect doesn't actually refresh the page, it simply pushes a new url to the history.

+ The container component is what you're passing into the component prop in the Route tag?
  + Absolutely. Remember that the component, render, and children properties are just props, they need a container to gain access to the redux store and props. Also, containers are still components. The proper term is "container component".

+ So the backend Rails API doesn't have any of the specific routes, just root. At that point, React Router handles the appending of additional routes. So why is the server able to read a huge convoluted url and even allow React Router to come into the picture?
  + That's a super low-level question, and something I wouldn't be able to answer without the code in front of me. It depends on how the router is configured and designed.

### Demo

+ Do route props still get passed into inline components?
  + Yes, route props are basically passed in everywhere, it's up to you whether you use them or not.

# W7D4 Scribe Notes

# May 11, 2017

Lecturer: Gage Newman
Scribe: Kelly Chung

### Yesterday's Projects Q&A

1. Jbuilder doesn't format the json object returned right? Just filters it.
  + Yes

### Homework Q&A

1. Are we ever going to just put one component inside another component?
  + You don't need to wrap a component inside a route - you can have
  React components be separate from react-router
1. HashRouter question
  + HashRouter captures the URL after the hash tag in the browser's URL
  and routes accordingly
1. Can't we use BrowserHistory as well?
  + Yes, but there's a lot of configuration that goes into that, so I
  suggest just sticking with HashHistory for now
1. Everything in your backend gets dumped after the hash tag right?
  + Yes

### Lecture Q&A

1. Could we instead of having an error message just redirect to another
route?
  + Yes, we can definitely do that.
1. What if we returned a route instead of a redirect in the render prop
of a route?
  + It will render the component in the route without changing the URL
  to appropriate path
1. What's the deal with History - in general?
  + Think of it as a stack: different routes pushes and popped off top
  of stack
1. Can you add a path to go 'back' to without actually visiting that route?
  + Probably could.
1. When you're using render, do you have to pass match and location to the
nested component?
  + Yes
1. When you want to execute code before you go back in history, how would
you do that ?
  + There are route hooks, and you can choose to add on back hooks to do
  exactly that
1. How is react router working under the hood?
  + *Whiteboard Demo*
1. What's the deal with the query string at the end of the route?
  + It's some sort of anti-caching thing
1. Why can't you go to the same route twice?
  + It's a feature that the makers of the `history` library decided to
  prevent
1. Can you still use anchor tags with react (since they used #'s')?
  + Probably, but I haven't tried

# 3/11

* Lecturer: Shamayel
* Scribe: Luke

## Lecture Questions

* Q: What are parens for in path matching.
  A: They make a part of a path optional. You don't really use them much.
* Q: When would you map to two URLs at once?
  A: Not sure what that means.
* Q: Can you put anything you want in the inner HTML of a Link tag?
  A: Yes.
* Q: Do you need a slash at the begining of your routes?
  A: Experiment!
* Q: Is Link just an ordinary component?
  A: Yes.
* Q: Can you have multiple index routes?
  A: No!
* Q: Do we ever say this.props.children?
  A: Yes, but it's in the component, not the router files.
* Q: Something about nesting in Gmail?
  A: If we wanted to switch to components they would have to be siblings.
* Q: Does each component go in the router?
  A: No. Think about PokemonDetailItems.
* Q: (from Shamayel) why isn't anything showing up?
  A: We didn't include children.
* Q: Does the Link render as an anchor tag?
  A: Yes.
* Q: Can we turn off the hash gibberish.
  A: Yes, use browser history.
* Q: What is this?
  A: There is no this in a functional component, so we just us props, not this.props.
* Q: (Shamayel) Where is the info about the user id?
  A: nextState.params.userId.
* Q: Where does the name userId come from?
  A: It's how I setup the paths in my router.
* Q: ...
  A: You need a conditional to prevent mapping over something that doesn't exist before notebooks have loaded.
* Q: Question about middleware.
  A: Sometimes things are invoked. Look at documentation.
* Q: Will our nested routes depend on what models we have?
  A: They roughly correspond, but don't push it too far.

---

# 10/26/2016

Lecturer: Gage Newman

# Redux Recap

---

+ `import` / `export` statements

```
export default Thing --> import Thing from './thing'

export const Thing --> import { Thing } from './thing'
```

+ `preloadedState` vs. `defaultState`

[component](https://github.com/appacademy/curriculum/blob/master/react/projects/pokedex/solution/frontend/components/pokemon/pokemon_detail.jsx) and [reducer](https://github.com/appacademy/curriculum/blob/master/react/projects/pokedex/solution/frontend/reducers/pokemon_detail_reducer.js)

---

+ rails's handling of `bundle.js`

[todos webpack.config.js](https://github.com/appacademy/curriculum/blob/master/react/projects/todos/solution/webpack.config.js)

[todos rails/app.js](https://github.com/appacademy/curriculum/blob/master/react/projects/todos/solution/app/assets/javascripts/application.js)

---

+ [jbuilder](https://github.com/rails/jbuilder)
  + `extract!`
  + `set!`
  + partials (see demo)
  + questions?

---

+ [`react-router`](https://github.com/ReactTraining/react-router/blob/master/docs/API.md)
  + onEnter and onLeave fire on every child path match as well
  + using onEnter to redirect

---

+ tools to debug react/redux
  + [react devtools](https://github.com/facebook/react-devtools)
    + a [context](https://medium.com/@skwee357/the-land-of-undocumented-react-js-the-context-99b3f931ff73#.33udmxsz9) [example](https://jsbin.com/luquranume/edit?js,output) and how the router and [provider](https://github.com/reactjs/react-redux/blob/master/src/components/Provider.js) work
    + withRouter also uses context under the hood ([example](http://aa-pokedex.herokuapp.com/#/?_k=tla06e))
  + [redux devtools](https://github.com/zalmoxisus/redux-devtools-extension)

---

+ redux & rails walkthrough

---

Notes:


## w7d4 Redux Recap!

### importing and exporting

* Q: why can we rename things that we import after export default
  - Gage: it's the only thing we're exporting

* Q: when do you define the things you are exporting
  - Gage: either with a constant, or if you are export default-ing then you can name them when you import them

* Q: what is the syntax for exporting objects and accessing their properties?
  - Gage: the same as we're used to, but you would have to remember to access the object's properties

### preloadedState vs defaultState


* Q: there will be an exam. Will we need to put together the config file by ourselves?
  - Gage: probably not but you should understand it

* Q: on the output path, why not just type out a string rather than using 'path.join_dirname'
  - Gage: you can type the string, but path ensures you put the output in the right subdirectory

### jbuilder

* Q: why don't we have to access things in jbuilder like 'thing.prop'

* Q: why is there an underscore when we write partials?
  - Gage: because it's functional

* Questions about jbuilder syntax
  - Q: What does the exclamation point do?
  - Student: I forgot an exclamation point once
  - Gage explains jbuilder syntax
  - more questions about jbuilder syntax
  - Gage explains jbuilder syntax more

### react-router

* Q: when are the cats fetched
  - Gage: any time the url is entered. you don't want to spam your api though

* Q: how do you check if you are spamming your server
  - Gage: always be looking at your server log

* Q: how do you handle all the api requests and not do that
  - Gage: there are a couple ways. you could have a handle enter callback to check if the state of the app has cats in it. or when a component mounts

### onEnter

* Gage asks if the students read the docs for onEnter
  - one student raises their hand
  - Gage appears disappointed
  - Gage explains how onEnter works and describes the arguments it takes

* Q: can we have index route set as the login instead of having a separate route for it?

* Gage avoids talking about callbacks given to onEnter

### Bonus stuff

* Gage shows the students react dev tools
* Gage explains context, but tells students they probably won't use it

* a question about context
  - Gage: it wasn't very supported until recently. there have been many changes.

* Gage shows students the Provider source code
* Gage shows students withRouter

* Q: what makes something a parent or child?
  - Gage: parent contains the child
  - Q: some question about parents, children, and Provide
    - Gage: ask me after lecture

* Gage shows students redux devtools

* Gage offers to do a walk through of react and rails, or not
  - few students are passionate about either option

### jbuilder homework
* Q: how do I avoid N + 1 queries?
  - Gage: you can access an object's associations in jbuilder. this can be handled with includes

* Q: where would you use includes?
  - Gage: I would include includes in the controller, but you can also use it in jbuilder

### post-lecture optional walk through

* Q: help me visualize the process please. There are so many levels
  - Gage: yeah, sometimes there are very nested components and passing down the props can be difficult to track

* Q: What is the most appropriate workflow for doing react? Where do we start, and what are the steps?

* Q: how do provide and connect work?

* Q: does the provider pass stuff all the way down to all nested components?

* Gage explains when one does and does not need to wrap a component in connect

* Q: do components have access to the state?
  - Gage: provider does pass it down implicitly, but our pattern uses connect
  - Gage explains how we only give components the info that they need

* Gage explains his react workflow
  - order: action, dispatch, middleware, reducer, component

* Q: how to deal with the asynchronous ajax request? We made an if statement in the component, would we also make one in the router?
  - Gage: it's better to have that case covered by your default state

* Question about middleware vs reducer

### post post lecture

* Gage draws routes on the board for the students
