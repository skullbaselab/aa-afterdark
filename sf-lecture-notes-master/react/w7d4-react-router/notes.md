10/26/2016

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
