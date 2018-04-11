## January 23, 2018

Lecturer: Neg Ruggeri

Scribe: Anastassia Bobokalonova

### Notes
Lecture this time around was entirely a code demo. The first 1 hour and 20 minutes was spent on reviewing the full redux cycle. The remaining 40 minutes was adding thunk/ajax to it.

The lecture repo Ned used, along with the code demo, is here:
[https://github.com/ruggeri/thunks-demo](https://github.com/ruggeri/thunks-demo)


### Lecture Questions

* I've never seen a namespace? Is it just for organizational purposes?
  * When all you want to do is nest the route under a word, yes.
* In the combine reducers, if you had a dogReducer, but it didn't exist, is that a problem?
  * Yes, it would throw an error because it's not defined.
* Why is it called, conceptually, a reducer?
  * It reduces your actions into the state.
* Can you explain whats happening on the client side?
  * Webpack will ensure that this file is run... *explains entry file*
* Why is it okay that the default will return the original state?
* If its going to re-render everything each time, then why is it that we don't mutate the state?
  * The answer is kind of complicated. *explains*
* What's the difference between Object.assign and merge?
  * Ah, here I was using an array of cats (`state = []`), and so used merge. Actually, its better to have a hash of cats, so I'll change it to be the way you guys are doing it (`state = {}`).
* You used let instead of const?
* Can you explain `for in` loop vs. `for of` loop?
  * For of loop is more synonymous with Array.map. This is new JS. For in iterates through the keys, but if you want to go one object at a time, this way is easier. Look at the documentation. It's pretty similar to `forEach`.
* Doesn't Object.assign not do a deep merge?
  * *changes to merge*
* Why does your `RECEIVE_CATS` replace all cats instead of merging?
  * I'm fetching all the cats from the server again, such that if any were deleted, I'm not just merging them all, but accurately showing the state.
* Could you write the Root as a React.Component instead of a functional component?
  * Yeah, you could *demos*, explains why you wouldn't need to in this case.
* What is the store?
  * The store is glorified, the two most important functions are `getState()` and `dispatch()`. It stores our state tree as well as allows us to dispatch actions to update it.
* Whatever components you build, they'll have access to store?
  * Yes, they'll be able to access it through the connect function. The Provider makes connect work.
* Do you need the constructor if we just super(props)? Isn't that the default?
  * Yes, since we don't have any internal state, we could have skipped that.
* Is it necessary to split the container into separate files?
  * It's just more organized.
* What does connect do under the hood?
  * Connect generates a new kind of component. The new component has props. How does it produce the properties to put onto the CatsList? So it calls this.getProps()... which calls this.context. The Provider has set this.context to have a store variable.
    * So what connect is doing is allowing the CatsList the ability to get part of the state it needs, and the chance to change it with dispatch?
      * That is correct. The CatsListContainer is like the firewall between the redux world and the React world.
* Don't you need to bind the this.setProperty?
  * No, since we're using a fat arrow.
* Before, you were already able to add cats and see them, whats the point of this?
  * Yes, but they never went to the database, so this goes to the server.
* Why are we passing the dispatch function into the parameter?
  * So we can use it. The dispatch function will be given to us by redux. For example, in mapDispatchToProps.
* Is a thunk a function that is closed over by another function that passes something to it?
  * Yes, pretty much. A thunk is like this is the next step to perform when you got the next step. Thunk is like a redux complicated.
* Where does `serverCats` come from?
  * When the promise is resolved, it will return the cat that the server sent down from the CatsController#index method.
* What is the format thats given of the cats? Is it jbuilder?
  * Today it's simply render json: cats. But tomorrow we'll be fancy and use jbuilder.


## November 14, 2017

Lecturer: David Dobrynin
Scribe: AJ Ansel

### Lecture Questions
* Are packages we download function the exact same way?
  * Yes, they are more complicated files but export the same. Gives example from lodash and loadash/merge
* Can we use the old syntax instead of export default?
  * There's nothing wrong with it but this is more modern and slimmer, so we should use this.
* Do these middlewares go left to right?
  * Yes, they will based off how you pass them as args to applyMiddleware
* Is this like the chain arrow things in the readings? (???)
  * You might be thinking about the thunk middleware how it takes three chained arguments?
  * We'll get to the function signature here soon and hopefully it will clear it up
* Is .then() jQuery syntax or vanilla DOM?
  * This is actually using a promise. This is both jQuery and A+ compliant promise that gives us the ability to chain .then() onto the end of our returned promise
* Can we use 'await' here?
  * Yes we can with ES8, (explains the difference between the two). Encourages for them to look it up on their own as it is currently outside the curriculum.
* Is the thunk action immediately invoked?
  * It will be invoked at the end of a something like a form. Then it will be dispatched and thunk will get it and invoke the next one when it gets it. This then invokes the last function i.e. fetchTodos()
* In the thunk middleware example, is the action the thunk? Or what would the action be? Next is the middleware?
  * Dispatch is the redux store's dispatch method (we can send them through redux cycle)
  * Next is the middleware
  * Action is the action that we provide it when we invoke it.
  * When the action is a function it will invoke it otherwise it moves on.
  * Gives an example of how it gets invoked under the hood
* So when it hits the if statement, it will actually call the action and pass it into the logger?
  * When the function is passes through it will invoke that action, yes. When you call it, it will then go back through middleware as part of the redux cycle but as an object so it goes right through.
* Can your reducers not make AJAX requests?
  * No. I mean in theory, you could but they are supposed to be pure functions. It would definitely not be best practice.
* At this point in the diagram can we erase the views from our backend diagram?
  * Great point! We will still use the term 'view' but we refer to it as the JSON we render back to the frontend
* Question about the response, is that some string with some JSON payload?
  * It is in essence a string yes, that's why we need to parse it. Our AJAX request will handle that for us thankfully.

## September 12, 2017

Lecturer: Aaron Wayne
Scribe : Kelly Chung

### Lecture Questions

1. We destructure when importing as opposed to exporting. Is it possible
to destructure when exporting instead?
  + Yes
1. Is it like a promise in itself?
  + AJAX requests return promise-like objects to us
1. Does your thunk middleware have to be the last middleware to pass in to applyMiddleware?
  + Depends on what your other middleware are
1. What will you do with thunk middleware?
  + We'll go into more detail in the code demo
1. Do we have to know when the store or next are passed as Redux devs?
  + No - it is not necessary to get the job done
1. Is the purpose of having secondary dispatch in a thunk to make this synchronous?
  + Yes
1. What is the action right there? (referring to thunk middleware code demo)
  + Action refers to the function returned by the thunk action creator
1. Is next a special function within the Redux cycle?
  + Nope - something handled by Redux. The next is in reference to the next middlewares dispatch
1. Why are we destructuring getState from the Redux store in the middleware?
  + There are a lot of middlewares that will call getState - even if we don't use it
1. If logger is the next middleware here - will we need to pass getState into next?
  + Nope - it will have already received store because Redux set up all Middlewares with store
1. How does this chain of middleware get created with applyMiddleware?
  + applyMiddleware will determine the exact order of middlewares
1. Question is how do we know that all the `next` functions be called in each middleware?
  + You need to rely on that to be true - otherwise it would never hit the reducers
1. Can you give a higher level overview of what this is used for?
  + Yes - *proceeds to give overview*
1. When are these thunk actions dispatched?
  + In lifecycle methods or user interaction with React components
1. Would it be accurate to say we will be writing our own thunk middleware and thunk action creators?
  + You will never have to write the middleware after today, but you will regularly write thunk action creators
1. Is writing these thunk action creators the main way we interact with our middleware?
  + Yes
1. Would it be accurate to say that the only practical purpose for a thunk is some asynchronous activity?
  + Yes
1. Is there some kind of middleware in the reducer?
  + Let's talk about what the point of middleware is
1. Does combineReducers follow similar trends in that they have function signature?
  + That is exactly correct

# 7/11/17
lecturer: Kelly

+ can we de-structure the b in a={ b: { 3 }}?

+ Does container component always send props to presentational comp?
  + yes, it will often map key value pairs to the props of the presentational comp


+ Is connect creating a react component?
  + No, it is


+ How does todos know that its slice of state is what you map in?
  + You get the full state, and then choose what you want from it.


+ Does the return value of the reducer get assigned to that key?
  + Yes, but not get into the weeds.


+ So the combine reducers is where you determine state?
  + Yes


+ This reducer mapping can only be done be combineReducers?
  + Yes, you will always use it


+ Will it break if the reducers aren't matched correctly?
  + Yes


+ If you have a multi-page app, would store be different for each page?
  + Probably, but we can talk about it later


+ Can high order functions both take in and output them?
  + Yes! Any function that curries


+ Are there another name for Thunks other than higher order?
  + No, they are a subset


+ Why don't we just use the inner function?
  + It's how redux and middleware are structured


+ Why do we have to use ajax requests in middleware?
  + It is the step directly before the action is dispatched so it is a good time to reroute it


+ Were web apps data management structured similarly before this?
  + Redux has completely reinvented the wheel. Uses unidirectional data flow.


+ Where does thunk middleware get called?
  + It gets applied as middleware at creation of the store.


+ What is thunk middleware, is it used?
  + This is the entire source code for a Redux library. You can either write it or import it.


+ Why is it called next and not dispatch?
  + It allows for multiple middlewares to be chained together


+ Where do you begin debugging something like this?
  + put debuggers everywhere and check them


+ Where is the action invoked?
  + In the mapDispatchToProps


+ Do we pass dispatch because the inner function needs to be able to dispatch a new action?
  + Yes


+ Is it normal for all these to be in one file?
  + No, this is for ease of examples.



# 5/9/17
lecturer: Shamayel

## Quiz
- Q2: Shamayel explains middleware
  - a student incorrectly explains how middleware interacts with actions
  - ?(couldn't hear) something about what actions are
  - so we're interacting with the database from the middleware? like a
  reducer that deals with function actions?
    - yes. like a reducer that comes before all the other reducers that
    creates functions that can have side effects
  - in the first case statement, don't we have to wait for async fetchFriends
  to finish before the next action?

- Q4:
  - what is happening between all the fat arrows?
  - if there is no more middleware, does the action go to the reducers?

- Q6:
  - so would the middlewarwe be defined in the api util folder?
    - it gets its own folder, and gets hooked into the store


## Today's Material
- Redux Cycle
  - can we think of the store as holding the reducers?
    -yes

## Debugging Todos
  - a question about initial state

## Rails
  - is API a special Rails word?
    - no. it is an example of an api
  - what is namespace?
    - changes our routes
  - does the way the controller handles the answers change if a route is namespaced?
    - yes, the route name is nested under api
  - what is '.include' doing in the controller?
    - prevent n+1 queries

## Full Stack Apps
  - why do we send off requests via the middleware instead of the reducers?
    - reducers must be pure functions. no side effects.
  - why can't the action make the request then dispatch the result?
    - actions don't do anything themselves. they just pass info around
  - if it's async, how do we get the reducers to behave?
    - promises
  - why not use jquery to make ajax requests
    - jquery comes with Rails, so you can use it. otherwise importing
    jquery only for ajax is overkill
  - why does rails include jquery
  - we've been starting a server for our frontend and backend. can we
  use one server for both?
    - yes
  - what does the ajax request look like through rails and middleware?
    - Shamayel explains the cycle
  - a question about next actions in pre-thunk middleware
  - could we write ajax requests inside the actions?
    - yes but it doesn't look as clean
  - question about connect and subscription

## Quiz again
  - Q1: is calling next like saying skip the middleware and go to the reducers?

## Demo
- when we do applyMiddleware, does the order we pass in middleware determine
the order actions pass through them?
  - yes
- do you have to include fetchPosts in the container?
  - if you want a populated app, yes
- are we expecting both a post and a dispatch argument? (in the container)
  - Shamayel explains mapDispatchToProps
- how would you load and modify initial state when loading the app?
  - lifecycle methods
- why is this.props.fetchProps() in the presentational component?
  - you have to fetch the posts to see the posts
- what if you just want to fetch the posts for one user?
  - do this in the controller
- if I was logged in and looking at this blog page, would I see the new
post immediately, or need to refresh?
  - websockets for chat apps
- question about `import * `
- please walk through what happens when we hit the delete button
- a question about async deleting, and being able to interact with the page while the delete request is happening
- why do we update rails first before updating the front-end side
- what is the single source of truth???
  - the db. state is a reflection of the db

---

# 3/7

Lecturer: Shamayel Daoud
Notes by Gage

## Todos Day 1

+ how do you **not** display a functional component?
  + have logic in parent and have it conditionally render
+ how do you decide whether something should be a controlled component?
  + always control inputs; they're the only things that have internal state
    + this.state re-renders every time?
      + not a problem; react is efficient
+ TodoDetailView a good pattern?
  + should be a functional component - all it does is render
    + when do you destructure props?
      + in render or in the arguments of a functional component
+ do you send all your props to `super`?
  + yes
    + so you can't pick out just the ones you need?
      + you should only have the ones you need
+ toggle CSS vs. conditionally render using React?
  + I choose React

## Quiz

+ middleware should always return `next(action)`, but we're not?
  + thunk middleware is a slightly different pattern
+ what does API mean?
  + sending a request to the Rails backend

## Today's Material

### import / export

+ when do you use `.jsx` extensions for files?
  + never - webpack handles this for us
    + ??
      + ... it always works for me
    + what about name collisions (`todos.js` vs `todos.jsx`)?
      + then you would need to specify which one
+ when can we rename things on import?
  + when you've exported them as the default export
    + so when you export default, the names don't have to match?
      + they don't _have_ to, but they should
    + export anonymous function, dev tools don't give it a name?
      + it can be nice to have everything named

### redux cycle review

+ why do we define the initial state in this file rather than in the store?
  + first, always have a default state in the reducer. second, if we want to
  preload some other information, we'll use preloaded state.
    + why set it in the entry file?
      + just makes sense to do it there
+ what is localStorage?
  + storing information client-side; don't worry too much about it
+ ??
  + the `todosReducer` manages the `todos` part of state; the `stepsReducer`
  the `steps` part of state
+ `_.merge` vs `Object.assign`?
  + merge is a deep-dup, assign is a shallow dup
+ newState?
  + I wouldn't write this code - we'll see some code that I did write later
+ why don't we pass todos to `receiveTodos`?
  + I think this app is just structured in a weird way
+ ??
  + `receive_` is typically used to receive things from your DB
+ mapStateToProps vs. mapDispatchToProps?
  + they both have access to the store
+ is not naming them the suggested pattern for containers?
  + yes

### backend structure

+ what about stylesheets?
  + `app/assets/stylesheets` hold stylesheets
+ namespacing?
  + all of the json routes for the frontend are under `/api`
    + similar to nesting under resources?
      + namespacing doesn't reference a resource - it just signifies something
+ what are other backends?
  + there are a ton - Django, JS backends, &c.
+ if a request-response cycle takes a long time, does the redux cycle wait for
it?
  + no, it's asynchronous
+ ??
  + the reducers are in the store
    + what if we want a loading spinner?
      + i'd probably use internal state and promises
        + not passing on the action?
          + no

### demo

+ what's the key if you don't ??
  + pass the key in or set it up in createStore
+ why are handleSubmit and handleDelete in different files?
  + they're in different components
+ are you using jQuery for your ajax requests?
  + Rails auto-packages jQuery for you; that's why we use it
+ no success & error callbacks on ajax calls?
  + nope, using promises and `.then` instead
+ can you turn off jQuery in rails?
  + talk to me after lecture
+ does Redux know what to do with JSON?
  + yes, JavaScript can handle JSON very easily
+ explain parentheses in arrow functions?
  + in this particular function, (()(()))
+ how do we ensure asynchronicity in our actions?
  + need to use async actions in views
+ is this how createPost and receivePost interact?
  + exactly
+ is there a scaffold for React/Redux the way there is in Rails?
  + there isn't
+ how did the new post get onto the page?
  + the component is listening for a new state (it gets it as props), and
  re-renders when it gets new props
    + so when the state updates, the component updates as well?
      + yes
+ are you redefining the `componentDidMount` method?
  + ... no
    + by default lifecycle methods do nothing?
      + correct
+ can you handle validation errors?
  + you can
+ props are immutable, but they change?
  + the props are coming from the state as defined by the `mapStateToProps`
  function
+ if we wanted a fail action to display the validation error?
  + `dispatch(receiveError)`

---

# 1/3/2017

Lecturer: Gage Newman
Notes by Louis

## Questions on import/export & destructuring

* What happens if we export default something that is anonymous?
  * Whatever is exported is named on import.
* What if you export multiple consts? Can you access them through properties of the import?
  * Yes, that's coming up.
* Is a ref like an HTML ID?
  * Kind of, but for React.
* (Some unclear question relating to replacing vs. adding todos to the state)

## Questions on Today

* How do we get the '/api' in the routes?
  * Namespace.
* What does "thunk" stand for?
  * I'm not sure.
* What if you wanted to fetch some, but not all, todos?
  * You could create a `searchTodo` that passes parameters in the request.
* Why do we need to have the currying pattern in the requestTodos action/thunk?
  * You need it to return a function so it can be dispatched by our thunkMiddleware.

## Questions on the Quiz

* Don't API requests happen asynchronously?
  * Yes, we don't know how long it will take.

# Previous lectures:

## Questions from redux overview

* How do we know when to use a container?
* Why do you render a container and not a presentational component?   

## Questions/Comments from yesterday's assignments

* How does the curried function work in mapDispatchToProps in our Tracks
Container? Why do we do that there and not in the presentational component?

## Questions/Comments on Quiz

* What does next do in the middleware?

## Questions/Comments from lecture

* Can you still have Rails views in your application?
* Is middleware asynchronous?
* Middleware generates a side effect. What does that mean?
* Why call controller method root?
* How does the synth know what page to root from?
* Why do we use 'e' in our onClick callback?

## Other Observations

* 3/4 of the students finished *up to* the tracks redux cycle the previous day.
