# W7D3

## 01/24/18
Lecturer: Isak Mladenoff
Scribe: Cynthia Ma

## Questions
+ Do we need to specify the `todo` after extract! ?
  + Yes!
+ What is the point of all of this? What are doing at all?
  + We are shaping the data we are sending down to the front end.
+ Where do we specify where to render json vs html?
  + in your routes to specify that the format output will be json.
+ In the controller, what are the `include` tag for after the active record?
  + You can load up your associations onto the active record object.
+ Why dont we use json.partial!
  + Thats a bug!
+ Can you walk through that syntax for the `json.tags` again?
+ How can we make json.tags?
  + json will make that new key for you.
+ Where did chart come from?
  + this is the redux dev tools!
+ What is the difference between json.set! tags VS json.tags
  + If you want a static key, use json.tags.
  + If you want the key to be dynamically created, us json.set! name


+ Feedback for Lecturer
  + Repeat student questions before answering them.
  + review the rails/react/redux flow of the backend to frontend
  + Have a before and after using json state shape.
  + Go over why the state shape should be shallow.

+ Immediate Action
  + student Q2 was not the same. Notified AJ, the quiz master.

# 11-15-2017

### Lecturer: Isak M.
### Scribe: Dallas H.

# Notes
## Q's
* Can you explain what is going on in [jbuilder code]?
* Are these methods?
  * Yes. A little bit of meta-programming is happening
  * JBuilder recognizes ActiveRecord objects and defaults the data structure to an array of objects
* What is this?
  * Redux Devtools! Use it!
* Can you walk through what we're seeing (redux devtools)
  * State has three children: Errors, Todos, and Steps
* Do we always use render instead of redirect?
  * Pretty much always when we are working with our API. The main point is just to send data.
* In your routes do you have a default to JSON?
  * Yes. The API namespace is set up to default to JSON.
* Can you walk through what you just did/ what problem you solved?
  * We were getting more information than we needed.
  * We were repeating ourselves a lot.
  * No we can use views to programatticaly grab just the data we need.
* In the GUI, what is rendering this (TODO app)?
  * A React Component.
* Can you show how we get the data?
  * He does
* Why are there no ids pointing at objects?
  * In this example, it is easy enough to deal with in the reducer.
  * We want to use an array when we care about order. This example could go either way.
*

## Notes
* Make up a clear example for 'Cannot read property "x" of undefined'
* Loved the whiteboard abnormal stat journey!

---

- Students didn't really like it when I discussed React Context so I kinda rushed through it, but I really think it is important background info...
- I forgot to mention how onEnter/onLeave hooks are called for every matching route so more nested routes will trigger parent onEnter hooks
- I tried reiterate and be as clear as possible about information passed to Route Components but should have also showed students using debugger
- Make sure to keep the FakerNote as a small surprise because the small break of reading some Chuck Norris facts worked well to re-engage
- Could probably clean up the RainbowRoutes Demo


# 9/13/17

Lecturer: Dallas Hall
Scribe: Anastassia Bobokalonova

## Questions
+ Where would we pass in the initial data?
  + It comes from the controllers.
+ In this example are we passing `@comment.body` to `json.body`?
  + Yep, thats a great way to think about ti.
+ Does the .extract method return an object with the variable name todo?
  + No, what this would look like: a POJO with the extracted attributes, but no keyword todo.
    + So what is that todo?
      + It's a variable we're actually passing in, from the partial.
+ Is this rendering? Or how is it returning information?
  + If we talk a look at the controller, it's the `render :index` function, which looks in `views/api/index.json.jbuilder`. It will render this file.
+ Lines 2,3,4, when you're extracting the attributes from `@chirps`, could you use `json.extract!`?
  + For sure.
+ In the partial, do we need `api/chirps/chirp`?
  + Yes, you need the api.
+ This is in your view. Is that technically in the front end, or the backend?
  + This is all on the backend, preparing my data to go to the frontend.
+ Could you use `chirps_url`?
  + If you use that here, it'll try to load the url from local host, not your file structure.
+ What is the `chirp: @chirp`?
  + The @chirp is passed from the controller.
+ Why is there a ! in `json.partial!`?
  + I dunno.
+ If I understand correctly, you have a json object and you mutate it constantly and at the end it gets returned to a string?
  + It creates a stringified JS object. String keys and string values.
    + What is the json?
      + This is a class (even though its lowercase) and we're just calling class methods to create stringified JS object.
        + Where is the object you're actually mutating?
          + What you're doing is creating a series of keys and values in a string. `"{'id':'#{chirp.id}'}"`.
+ When we get this data back on the frontend, do we have to use `JSON.parse` each time?
  + Because we're using jQuery, it does it for us. But if you used vanilla JS, yes.
+ Do we ever actually define this whole data structure, or is this a concept?
  + Yes. We define this through our reducers. If we do store.getState(), it should look like this state shape I just wrote.
+ So the `entitiesReducer` defines what is nested under `entities`?
  + Yes.
    + And the order doesn't matter?
      + Yep, JS doesn't preserve order unlike hashes in Ruby.
+ Is `entitiesReducer` a combined reducer? Since you said every slice of state should be a table.
  + Yes, it takes a `chirps: chirpsReducer`.
+ Can you give an example of an action for `sessionReducer`?
  + `RECEIVE_USER`.


# W7D3 Lecture - Redux Review / JBuilder

# 3/7/17

Lecturer: Gage
Notes by Claire

# JBuilder
* Can we make our keys integers? (in a jbuilder json object)
* How do you know when to use words in quotes vs symbols vs commas? (when building up jbuilder json objects)
* When we make an ajax request to the todos controller, why are seeing json and not html?
* How do we store the json response on the frontend?
* Can we include metadata in our jbuilder repsonse? (student wanted to add a count value)

# Redux Review
* Which action creator is a thunk and which one is a regular action creator?
* Do we have to use `Provider` to use `connect`?
* Do we have access to props defined inline on a component? (i.e. `ownProps`)
  * Do we need to include them in `mapStateToProps` to have access to them in the presentational component?
* Can we assume presentational components will always be classes?
* Are there benefits to making a component functional as opposed to a class?  Can we make all components classes?
* Is it standard to combine search terms with `+`?
* Why is this component extending `Component` and not `react.Component`?
* Can we call `setState` in a functional component?
* Can functional components have internal state?
* On line 29 of the `render` function, what does `let { giphys } = this.props` do?  
* Does jQuery ajax return a promise or a promise-like object?
* Is it convention to name the thunk action the same as the api util function?
* Why import `*` as opposed to an indiviual named export?
* What determines the structure/format of an api response?
* Why is GiphysIndex not a functional component?
* Where can and can't you place debuggers?

# Quiz
* Where did the `@author` variable come from?
* How do we create nesting in jBuilder? How did we get `author` key to point to a hash?
* If we are doing complex active record queries or aggregate information, should we do that logic in the jBuilder view or write a method in the model?

# 1/4/17

Lecturer: Gage

## Notes

 * Homework solution has a `REQUEST_GIPHYS` constant that isn't used
 * You can also obscure an API key by setting it to an environment variable in the backend that you reference from the frontend

## Questions

 * Do we not have to use `respond_to` anymore?
 * What's the difference between using `set` and using `json.(key)`?
 * Are there non-bang versions of the jbuilder methods?
 * Is there a way to say "all properties except these" instead of explicitly listing all the things we do want?
 * Is there a way to hardcode in something that would achieve ^
 * Is `Component` the only thing we need to import from the `react` library?
 * Is the only reason we import `Component` by itself to `extends Component`?
 * When does a functional component turn into a React component? (confusion over the difference between a class component and functional component)
 * Can you render React components from inside functional components?
 * Is there a difference between `onSubmit` on the form and `onClick` on the button?
 * Do you have to sign up for your own API key?
 * How do you avoid exposing your API key?
 * How do you figure out what url to put in an `<img src>` tag (if there are multiple urls in the response object)?
 * Do we always need self-closing tags in JSX?



# W7D4 Lecture - Redux Routes/Jbuilder

# 10/26/16
Lecturer: Kevin McCall

### Questions on yesterday's project/ Common mistakes
* Where does preloaded state come from? - it is just a parameter
* Creating a todo kept giving a `400` error - my `create` method had no `id`, where would I get this?
* What is the difference between internal component state and application state?  
    - When would we want to use form data inside of application state versus component state?
* Is there a way to require React globally? -TO LOOK UP

### Quiz
* What is jBuilder?
* Router stuff!
  - What is `withRouter`? People seemed really confused about this question.
  - If `withRouter` is higher order component does that mean that the `Provider` is also a higher order component?
  - When would you want to use `this.props.router` in a component?
  - what is the difference between `push` and `replace`? - tabled until later

### Rainbow Routes
* When we defining the routes in Rainbow routes why didn't we wrap the router? We did but we wrapped the `Root` in the entry file.
* Is using version 3 of React Router going to be stable?
* `hashHistory` is a singleton
* Should we use browser history or `hashHistory`? - We will use `hashHistory` in our program. Why might we want to do that? (student's didn't really know the answer)
* Is `hashHistory` sort of like a state object? It kinda seems like we are just changing state when we click on links. - we are listening for a hash change. So in a way, yes it is.
* What is the equivalent way to specify a node module version like we do with Gemfiles?
* People seemed pretty confused about how to have the router in child components without passing down through props (`withRouter`).

### Router Lecture
* What is path syntax? Why does it look so weird?
* People seemed confused over Route Components
* Why would we ever want to use `replace` considering user experience? - redirects!
* If I was on my app went to google and then came back with `replace` would I still be able to go back again?

### Final Questions
* What is `nextState` inside `onEnter` hooks?

### jBuilder
* Where do jbuilder files live?
* How do we test that our jBuilder is working?


# ?/?/16
Lecturer: Kevin McCall
--
## Common Mistakes from Yesterday

## Questions from Todo Project
+ `mapDispatchToProps(dispatch, { todo })` in `TodoDetailViewContainer`, what is the second argument? (props)
+ `connect(null, mapDispatchToProps)` in `TodoDetailViewContainer`, can you instead define a `mapStateToProps` in order to pass the props?
+ Should we still care about strong parameters?
+ What's the difference between having the form have an `onSubmit` and having each input have an `onChange`?
+ What's the purpose of having controlled inputs?
+ Why set the internal state of the form component v the store state?
+ How does the form know to trigger the `onSubmit` if there is no input type specified as Submit? (html button)
+ What is the difference between `onClick` and `onSubmit`? (the latter is more correct because an html form can be submitted on Enter and not just by clicking Submit)
+ How do you submit if there's a form with multiple buttons?

## Quiz
+ How do these routes work with the routes set up on the Rails app?
+ Which routes are the user going to see?
+ `params[:id]` v `this.props.params.id`
+ Which routes get `this.props.params`?

## Homework
+ What's the purpose of `hashHistory`?
+ Could you ever `pop` from `hashHistory?`?

## Demo - FresherNote
+ Is the `children` property on `props` always available?
+ Do you need to change anything in Rails to make it render results in `json`?
+ Even though we go to different routes, why does the same component remain?
+ How would you deal with this? (`componentWillReceiveProps`)
+ Is the `App` the best place to put `requestNotebooksOnEnter`?

# 01/06/2017

# w7d3

## Agenda
* Questions from yesterdays's assignment (10 min)
* Homework
* Today's Material
* Quiz Solutions

# Questions about yesterdays project

* none
* about a third of students got to part 2

# Last Night's homework

* walk through of solution, noting the Router and _briefly_ talking about children

# Path Syntax
* What is the difference between * and ** ?
* How do we use the colon before the component mounts? - demo later
* hashHistory or browserHistory - in production we use browserHistory but we will use hashHistory

# Link
* How does `activeClassName` work?
* When is `<Link>` considered active?

# IndexRoutes
* root directory - nesting question. Was confirming their understanding.

# FakerNote Demo
* Question about why we put redirects in onEnter hooks?
* where does `nextState` come from?
* I couldn't hear the rest. :/

# Quiz
* Link versus push question
