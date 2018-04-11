# W7D1

## 1/22/2018
## Lecturer: David Dobrynin
### Scribe: Stephen Pangburn

## Questions

* Flux uses subscribe I think? With React/Redux we don't use it anymore?
  * We will get into that in a moment, but we DO use it, it just happens through a method called `connect`
* Why is the import wrapped in an object?
  * This is usually referred to as JavaScript destructuring. However, that is not quite accurate. In the case of React, this tells `import` how to work. Without curly braces, it looks for the `export default` (unnamed exports), whereas with curly braces, it looks for specific exports with that name (named exports)
* Why is createStore wrapped in an anonymous function?
  * That isn't important right now, but will be later on when we add more sophisticated parameters to configureStore (like preloadedState)
* What happens with the rootReducer?
  * We will get to that later, but it's a similar principle to the store, we just want all our reducers in one place.
* (With regards to all actions hitting all reducers) So that means you can't have two actions with the same name if they belong to different reducers?
  * You CAN, you just have to bear in mind that both reducers will respond every time.
* Does `Object.freeze` cause problems when nesting state?
  * Perhaps, but if your state is deeply nested that's probably a red flag anyway. Try to keep your state as shallow as possible.
* How is the shape of the state determined?
  * The rootReducer's layout for the state is literally what will be reflected in your application's store.
* Why not just reassign the `state` variable directly?
  * You technically could, it's just not good practice.
* Can reducers be nested? 
  * Yes
* Is there any reason why we don't use something more generic like `addItem` instead of `addTea` and `addCookie`?
  * Yeah, you most definitely could, it all depends on where you want to draw the boundaries of your state.
* Why is it common to make the action type a string instead of a constant?
  * We use it in multiple places, and the error is much easier to track down when you're relying on specifically-named constants instead of strings, which are easy to misspell.

## 11/13/2017
## Lecturer: Aaron W.
### Scribe: Andres A.

## Q's
 * Does the action live in the store.
    * The action will be a callback that will be ready to be invoked by the dispatcher.
* Are we going to use *subscribe()* ?
  * We will be using the *connect()* from *react-redux*.
* For every of aspect we want to update do we need a reducer?
  * We do, there are several ways of organizing our states and reducers.
* You could accidentally have typos in your string, right?
  * Yeah, but if we you are referencing the same constant, then the value of the misspelled variable will be the same.
* What does the *connect()* returns?
  * We will cover that on the demo. Extract from [documentation](https://github.com/reactjs/react-redux/blob/master/docs/api.md)
  ```
  A higher-order React component class that passes state and action creators into your component derived from the supplied arguments. This is created by connectAdvanced, and details of this higher-order component are covered there.
  ```
* Does container generally just pass state?
  * One of the golas is to filter the information that goes into our *components*.
* So the container filters out the relevant information to the presentational component?
  * Yep.

## Demo Q's
* If we use curly braces instead of () => () will that work?
  * No it wont.
* Is this syntactic sugar, the () => ().
  * No it is not, it is a way of evaluating expressions, that we use to our advantage to break down multi line single expressions.
* Are actions typically *CRUD* functions.
  * Yes to a point, specifically to update our state.
* Why do we use Bbject.freeze instead of just copying a new state.
  * Copying a new state could be a heavy operation, so we want to only copy when necessary.
* What is dispatch?
  * Dispatch is the way we interact with our state.
* Why do we need to export the result of a *connect()*?
  * Because the result of *connect()* will return a *__react component class__*.
* Is there a reason why we use indexes as keys in your return function for a component.
  * This is a contrived example, we should only add unique values to they *key* attribute of a JSX HTML component.

## Notes for Presenter:
  * Some questions were not repeated to the students.


## 9/11/2017
## Lecturer: David D.
### Scribe: Dallas H.

## Q's
* Is Redux the most popular implementation of Redux?
  * Yep
* Do we have to manually subscribe to the store?
  * React-Redux gives a `connect` function that handles the subscription for us.
* Is the main practice for testing .jsx just to assign things to the `window`?
  * No. But it is a very normal way. (There are also testing libraries)
* You said that *every* reducer will get every action, but isn't there only one reducer that Redux knows about?
  * There is one *root* reducer, but we also use a `combineReducers`, which will make sure that the actions go to each individual reducers.
* Why use a constant for action types?
  * To let us know that it shouldn't be mutated (stylistic).
  * More importantly, it helps us avoid spelling errors!
* Is it a performance-based decision to not deeply check the state object?
  * Yes.
* The state/store is an object?
  * The store is and instance of `Store` class.
  * The store's `state` is an array.
* Isn't the state supposed to be an object? Why is it an array?
  * We are setting a *slice* of state as an array. The actual state is still a POJO.
* Can we combine similar reducers to make our code more dry?
  * Anything is possible, but it wouldn't make sense in most cases.
* In the teasReaducer, why don't we have to put it as an object? Doesn't it get every action?
  * It gets every action, but it only gets the slice of state pertaining to itself.
* We can access the store through props or state?
  * The containers have acces to the store through the connect function.
  * Yes.. both. See demo.
* Why did we make a store.js file? Couldn't we do that in the entry file?
  * Later on there will be a lot more that goes into store.js later.
* Isn't threading bad? Why is it okay to pass from parent to child?
  * Once you pass props down more than one layer it gets tedious and error-prone.
* Does connect run every time?
  * Nope. It runs the first time, gives us a connected component, and that connected component handles the listening and updating.
* Will a cookie action trigger the debugger in the teaList?
  * Not in this case, because that component is not being re-rendered because its state has not changed.
* How are you able to not have a render function?
  * For a functional component, you just return the JSX
* Why do we have to keep track of the inputs constantly and not just on submit?
  * We know that we have a single source of truth (the state). We update the state, and then render that update. That way we know (just by looking at the page) that we are synced up.
* Are components locally stateful?
  * Yes, if you deliberately give them a state. Not every component has a local state. They can have props, which come from the the container which pulls from the global state, however.

## Notes for Presenter:
  * When showing the file structure, either show a diagram or use a text-editor that allows a zoom on the file-tree.
  * Action creators should probably be covered before connect.

## 3/6/2017
## Lecturer: Claire Rogers

### Questions
#### Previous day's project
* When can you use export const at bottom of the file?
* Why do we bind functions in our constructor functions?
* Is Redux a framework?

#### Lecture
* What's the different between a framework (like Rails) and an architecture?
* What values do we have access to when we destructure?
* Action seems to be closing over `ADD_COOKIE` constant. Is that used at all?
* Is fruit stand app an exaggerated example? Do we want to capitalize all actions?
* Why do we hardcode in tea types in the actions?
* Is this a front-end schema that we'll be using to structure our projects?
* Why do we refer to reducers as plural?
* Why do we use curly braces to import actions?
* Does `Object.freeze` shallow freeze?
* Why are we destructuring the state with `...`?
* Do we have access to all of the state in a reducer?
* When we return something from the state what happens to that data? Does view
layer get access to it?
* Are props passed to the store?
* Why is the homework different from the current pattern we're learning in lecture?
* What happens when you remove store as an argument to the provider?
* Will your root component always be a functional component?
* Difference between subscribing and dispatching?
* When do we use `.jsx` file extension?
* `mapDispatchToProps` returns a pojo with a key that has a value of a function.
What's up with that? How does that work?
* Where are state and dispatch passed in as arguments?
* Why do we use `setState` if we only want to change state via actions?
* Are containers just react components?
* When you subscribe, it returns a function that will allow you to unsubscribe.
  Do we have to care about that?
* Do we always use provider and connect?

#### Homework and Quizzes
* nada

### Mistakes
* Importing non-default exports
* Confusing internal component state with overall app state.  Students thought calling `this.setState()` was updating store.
* Destructuring parameters.  Students didn't realize that keys were being assigned in action creators.

### Notes
* Students were most confused about container components.  Recommend expanding upon this portion of the lecture.  
* Some students expressed concern that they were not masters of Redux.  I think it would be beneficial to state that we do not expect them to be after day 1.


# W7D1

## 1/2/2017

## Lecturer: Shamayel Daoud

### Project Solution Questions: Widgets

* How do the tabs work?
* What happens if you bind to null? Does it change the context? (No.)

### Quiz Questions

* What's the difference between mounting and rendering?

### Lecture Questions

* What's with the `...` before `state` when we're creating `newState` in the reducer?
* Why do we pass the index as a key when we create `<li>` elements?
* Where is the dispatch for the action?
* How does the reducer get hit? (Every dispatch hits the reducer)
* How is `dispatch` made available? (It comes with `connect`)
  * How is this related to the `Provider`?
* Why does the `Provider` need a div inside? (the `Provider` wants only a single element passed to it)
* Should `setState` be replaced with dispatching actions?
* Do you do anything with the component that you get back from using `connect`?
* When we use `export default`, do we need to give it a name when we import?
* Can we use `export default` more than once in a file?
* Can we use both `export default` and `export const` in the same file?
* Does every action still get every reducer if we use a `rootReducer`?
* Do action `types` need to be unique across reducers?
* Can we put something in `rootReducer` that will affect all of the actions? (No, the `rootReducer` just combines all the other reducers.)
* Can we see an example of how to use `selectors`?
* When do we need a `constructor` in the components?
* Where would you clear the input box after submitting?
* If `componentDidMount` is always after the constructor, why wouldn't we just put things in the constructor?
* In the reducer, is the state only a piece of state, or the whole state?

---

# 10/24/16

## w7d1 Redux wooooo welcome back Gage

* Immediately after roll call: Gage asks if any students said their own names very loudly
  - A student yells 'John Cena'

* Gage asks how many students watched the video over the weekend
  - Almost all students raise their hands!

* Gage gives an overview of Redux and explains a mesmerizing diagram about the Redux cycle

* Q: Is it (Redux) similar to the MVC model?
  - Gage: sort of. I wouldn't use that as an analogy too heavily. They are two separate systems

* Gage mentions Facebook. A student raises and lowers his hand. Facebook is a very exciting topic.

* Q: what is the point of flux if react can do what it does?
  - Gage: it is for organization

## Demo

* Gage demos a redux cycle with lots of debuggers

* Q: Where is apple? Where is old state getting stored?

* Q: What is time travel debugging?
  - Gage: it is possible to have state history. We won't get into it in this course

## File Structure

* Gage: are you all familiar with webpack?
  - A few students nod

* Q: Can you only have one store? Can you have more stores?
  - Gage: yeah but that would be weird so don't

* Q: If we had rails on the backend, would we also have a backend folder
  - Gage explains the file structure

## State Shape

* Q: if you use an impure reducer, would you get an error?
  - Gage: in JS land, you don't get errors. Rather, things just start getting weird
  - Gage: try to get all weird errors out of your system today

* Q: Why shouldn't we mutate the old state?
  - Gage: so you don't get things you don't expect

* Q: What if we receive an action we don't care about? return a copy of state or original state?
  - Gage: it's ok to return the old state in the default case

* Q: how does combining reducers work?
  - Gage demonstrates how to combine reducers
  - Q: And that is done automatically once you set it up?
    - Gage: yeah

* Q: can you have a reducer that touches multiple parts of the state?
  - Gage: yeah (demos on the whiteboard)

## Store

* Q: What arguments are passed to the callback?
  - Gage: none

* Q: how does subscribe work? Do you have to resubscribe?
  - Gage: you only have to subscribe once

## Components

* Q: Does map dispatch to props set up click handlers?
  - Gage: Sure that's a good way to think about it
  - Gage demos an example

* Q: about including a database
  - Gage: we will talk about that tomorrow

* Q: if we change actions, will a component re-render?
  - Gage: yes because they are also props

* Q: how does an action/component know what to dispatch?
  - Gage: connect does this. Gives component access to the store
  - Q: so then is the component subscribed to the info changes?
    - Gage: yes
  - Q: will the component re-render when any part of the store changes?
    - Gage: only when the props change

* Gage evades an out of scope question

* Q: when do child components update?
  - Gage: when its props are updated

* Gage pushes back a quiz question to when the quiz will be discussed

* Q: Do you have to import the container component file to presentational container?
  - Gage: no. presentational components are made to be dumb as possible. They only need to know what react is

* Q: does a container component have a render function?
  - Gage explains container and presentational components

## Redux Cycle Round 2

* A question about the first thing that gets passed to the store (@@redux/INIT shown in chrome)

* Q: could we wrap multiple components in a container?
  - Gage: yes you can break up components

* Q: Why are action types in all caps?
  - Gage: they don't have to be in all caps, but I like the signposting

* Q: do you ever call the reducer directly?
  - Gage: not unless you're testing. which you should do

## Quiz

* Q1: when to use setState vs automatically rendering
  - Gage: we're moving away from components having internal state. But yeah, setState renders

* Q: When do child components re-render?
  - Gage draws a react decision tree

* Q: isn't it wasteful to re-render children?
  - Gage: yes a little, but it's only the changes between the real DOM and virtual DOM

* Q: so connect handles the subscribe for us?
  - Gage: yes
  - Q: how would it be done manually?
    - Gage: talk to after lecture because it's interesting. but I don't want to talk about it now

## Homework Solutions

* Q: What are react developer tools in the chrome console? How important are they?
  - Gage: idk what they are so they can't be thaaat important. people use them. probably.

* Q: What was the bonus asking?
  - Gage: I'm not entirely sure. Guessing it's to get more practice adding components

## Friday's Project

* There are no questions

# 08/23/16

Questions:
## W7D2

Lecturer: Gage

#### Lecture - Redux Day 1

- What's the point of Redux?
- Why do we need to use `lodash`?
- Can you mutate the state in the sub-reducers? (No)
- 50/50 confident on pure functions
- If all the reducers are receiving the same action, does that cause performance lag?
- Does the action dispatcher always replace the old state?
- How would you keep track of the state history if the state always gets replaced when dispatching an action?
- How do you pass the store multiple reducers? (`combineReducer`)
- Where do you set up the initial state of the store?
- Along with using a default argument to the reducer to set the state, can we also use `preloadedState` as the second argument to `createStore`?
- If you're only passing part of a store to a reducer, where does the slice of the state get parsed out?
- How do you know when to break up the reducer into sub-reducers?
- If you change the reducer after the store has already updated what happens? (ie. hot loading the store)
- Why do we need to use `forceUpdate.bind(this)`? Why do we talk about it if we call it an anti-pattern?
- What does `connect` do under-the-hood that allows `mapDispatchToProps` to pass new props whenever the state changes?
- What's the design pattern for components? Design presentational components or containers first?
- Why do we use string literals as action types?
- Question about passing `mapDispatchToProps` keys as props to the presentational component(s)
- How to import the result from calling `combineReducer` on sub-reducers?
- What happens if the state isn't easily decomposed into sub-reducers?
- What happens if an action changes multiple slices of the state?
- What do the keys of the object passed in the `combineReducer` specify?
