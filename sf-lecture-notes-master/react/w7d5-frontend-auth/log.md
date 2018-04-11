# 9/15/2017

Lecturer: Dallas Hall
Scribe: Anastassia Bobokalonova

## Front-End Auth Questions

+ I noticed in your Utils, you're returning the the `$.ajax` call?
  + Yes, I'm explicitly returning this. I could have implicitly returned with just parentheses instead of curly braces.
    + Ultimately you just want a promise object back?
      + Yep.
+ Why do you wrap user in brackets in the data field?
  + I'm expecting this user object to look like `const user = {id: 1, username: ""}`. But in my controller, I expect it to be nested under user, so I'm using object structuring to do so.
+ Whats the reason for having an underscore in front of `nullSession`?
  + It is a convention for the default state, to not get confused with the actual object.
+ Did you say redux throws an error if it is undefined?
  + Yes, if `state = null`, it would. So we say `state = {currentUser: null}`.
+ You could user `merge` instead of `Object.assign`?
  + Yes, but you need to be aware that they're different. Merge will merge objects, so if you have 2 arrays, it will merge the contents instead of replacing it. I basically always use Object.assign.
+ With lodash/merge, are you always safe with returning a new state if you start with a blank object?
  + Yes, but you're not safe from other pitfalls.
+ Why is `currentUser` in curly braces in `Object.assign`?
  + This is again, object destructuring, so we overwrite the right part.
+ Until we create `mapStateToProps`, is it convention to use undefined?
  + Yes, its required. The first argument of connect needs to be `undefined` or `mapStateToProps`.
+ The way you have it set up, you're not capturing information and sending it to the component...?
  + Yes, let's take a look at it.
+ `handleInput` is automatically receiving...?
  + username, and it returns a closure, this arrow function, which closed over type.
+ Why is navbar `const` (a functional component), instead of using `class`?
  + I'm not keeping track of internal state, so I don't need a full `React.Component`.
+ Why do you capitalize Component again?
  + When we're joing JSX components, React/Redux cares about capitalization for those.

## Pokedex, Quiz Questions
+ Is storing currentUser on window bad?
  + If you're paranoid about storing the currentUser on the window, go to `createStore(preloadedState)`; after that executes, you can clear it.
+ Why does it not work: "Store the current_user as a data attribute in the <head> of the root route"?
  + You're going to have to use jQuery to pull it out...or vanilla DOM... So I guess it works too. 


# 5/12

Lecturer: Jenn
Notes: Gage

## HW

_no questions allowed_

## Pokedex

_questions allowed, but no questions asked_

## Frontend Auth

+ where does the password hashing happen?
  + on the backend, in the model (same as before)
+ how are static assets handled by rails?
  + a request to "/" returns the static page HTML along with the CSS
  and the js for the React app

## Demo

+ `render :show` is still working the same?
  + yes
+ what is the `logged_in?` helper method doing for us?
  + it will be helpful to be able to conditionally render some info in
  our views
+ why not just use `current_user`?
  + could do that as well
+ why write `{user}`?
  + we want the user's information nested under the key `user`
+ organization of util files?
  + `util` folder with separate util files for each type of object
+ `{user}`?
  + `{user: user}`. _explains by writing out the desired output._
+ where does the response JSON come from?
  + it comes from the backend via the controller / view
+ where do the errors come from? and in what form?
  + they are an array coming from the controller
+ why not merge `nullUser`?
  + that would probably also work
+ returning `nullUser` vs. the current state?
  + sometimes we need to wipe the user from the state
+ ??
  + ...
+ why delete `window.currentUser`?
  + so that people can't access the protected information after someone
  logs out
+ can't they access it through the store?
  + only if we've assigned `window.store = store`, which we wouldn't do
  in production
+ how can we use `window` in the backend?
  + we're writing JavaScript!
+ how come we can't log in to multiple users at once?
  + one session token per browser
+ `html_safe`?
  + makes sure we're not injecting anything weird into our HTML
+ bootstrapping current user?
  + used to prevent extra requests to get the user's information
+ so `window.currentUser` would get deleted?
  + yes, it only lives on the window for a split second
+ why is `loggedIn` nested under component?
  + it's not! _explains destructuring syntax_
+ what are these props in the auth route component?
  + we're grabbing the route props and spreading them out into their
  separate named properties
+ is this (object spread operator) just a redux thing?
  + it's an ES7 thing
+ why `...props`?
  + so that we don't have `props.props.location`
+ why do we have to pass in props?
  + because we're using the Route's `render` prop rather than the
  `component` prop **and** we're also defining our own functional
  components that wrap Route components
+ `...object`?
  + same as listing out each key / value pair in the object
+ why don't presentational components have access to the store?
  + that's not the pattern we're using
+ how does redux know which are our presentational components and which
are our container components?
  + ...?
+ so is the purpose of container components to connect presentational
components to the store?
  + yes.
+ can we write react / redux differently (without `connect`)?
  + yes...?
+ if we weren't using redux, could we pass props down from ancestor to
descendant?
  + yes.
+ `withRouter`?
  + allows us to access routing information in a component not directly
  rendered by a route
+ do you need `withRouter` to access the path?
  + in this case, yes, kind of

## Quiz

+ do we have to write an application.js file?
  + nope, it comes with rails
+ does this auto-include the CSRF token for us?
  + yes.

## Notes

+ clip the mic to something? scarf, maybe?
  + nvm, you got it :)
  + it sounds kind of tinny, though
+ seems like lots of confusion around the usage of `nullUser` in the
sessionReducer
  + might be worth addressing at a curriculum level
+ quiz Q1 is outdated!
+ quiz Q3 and Q4 are bad questions! (??)
+ might be worth moving the crazy AuthRoute thing to the day before

# 3/10/17
Lecturer: Gage Newman

## W7D5

## Questions From Pokedex
* Should we dispatch actions to fetch pokemon details in lifecycle methods or
  in `onEnter` hooks?

## Frontend Auth
* What difference does it make having the user bootstrapped to the window?
* Are the error messages coming from the frontend or the backend?
* What does the error look like when it is received by the frontend?
* Since we have a SPA, are we now going to use `flash.now[:errors]` instead of `flash[:errors]`?
* Are the errors part of state?
* Are the errors being rendered by `application.html.erb` or by our frontend components?
* Do we use jBuilder to render the errors?
* Do you have to have your initial state include an empty array of errors?
* What do square brackets around a key in a POJO do?
* What is the difference between putting a `onSubmit` prop in a form vs doing an input with `type=submit` inside the form?
* Why do we key into the error with `responseJSON`?
* When you chain `.then`s, do the subsequent ones use the original promise or the return value of the preceeding `.then`?
* Does sayings `data: { user }` set a key of `user`?
* Why do we have to set the status code in our repsonse?
* When we're merging POJOs, what happens if they have keys in common?
* What is the first argument being passed to `merge`?
* Why do we merge the `_nullUser` object with an empty POJO?  Why not just return it directly?
* Do we have to use `Object.freeze`?
* Does a deep freeze function exist?
* Are the keys of our state set by the root reducer?  And the values set by the individual reducers?
* Where is the `loggedIn` piece of state being stored?  (`loggedIn` prop is set in `mapStateToProps`)
* When bootstrapping, and we call the user partial, is that what the entire view will look like?
* Shouldn't the partial be referred to with an underscore?
* How does our frontend app see `window.currentUser`?
* Is the user stored on the window for demo purposes, or is this how we actually do it?
* What do we do with `window.currentUser`?  What do we use it for?
* Is `window.currentUser` different from the default state in the session reducer?
* In `configureStore`, what happens if `preloadedState` is never passed in?
* We can write javascript inside HTML?

## Quiz
* Why do we want the backend to confirm that a user is logged in before carrying out an action?  Isn't this handled by the frontend?
* If a user is not logged in, should we instead just redirect them to a different page?  

## Practice Assessment
* How long is it?

# 1/6/17

## w7d5 1/6/17: Ryan

## Quiz

- Q2 is silly. Ignore it

## Questions

## Front End Auth

- How does the front end get the bundle.js file?
- When are you sending the password? Are there security concerns?
- Are the cookies are still holding the session token?
- Should the current user portion in application erb be a partial?
- Could you hijack the view to show a current user when no one is signed in?
- Is the preloaded state merged with the default state?
- How does the app know the different between user machines?
- How do we get the right current user?
