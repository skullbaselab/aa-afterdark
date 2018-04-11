# W6D5

## 19 January 2017

* Lecturer: Aaron Wayne
* Scribe: Ryan Mease 

## Questions 

* We have to invidivdually install each package? 
 * Yes, just like gem files
* What do you mean about what it's returning? Are they actual HTML Elements?
 * No, and we'll talk more about that in a few minutes 
* Are you returning a string or something else? 
 * This is JSX; you're going to handle it just like HTML
* Render does not actually put things on the page? 
 * That's right; render() itself does not mount objects on the DOM 
* Could I populate this.state outside of a constructor? 
 * No, you should only define state key/value pairs in the constructor 
 * Elsewhere, you should use the async function setstate()
* Can setState destructure an object if just given the key? 
 * Yes, it will do a shallow merge 
* What do you mean by shallow merge? 
 * It means that it will not overwrite nest objects 
* Isn't it more standard to use Capital file names for components? 
 * The convention is to use capital names for the components themselves, not file names
* I notice that we bind it in the constructor 
 * Yes, we bind it there so that we don't have to bind it in multiple places 
* If you didn't put an event as the parameter to the callback, will it refer to the object itself?
 * Yes, could could do that using e.currentTarget
* Is rates= the same as props=? 
 * This will set the key as a member of the props object 
* Why do we need to add keys to iterative components? 
 * This helps the React engine think about the differences between related components (diffing)

## 10 November 2017

* Lecturer: Dallas Hall
* Scribe: AJ Ansel

### Lecture Questions
* When you saw the error that said "opps I broke it.. " can we see what error caused this?
  * Yes, we can look in the console and see that it said we likely forgot to export (everyone wows)
* Do you have to add something to your dev tools to get those errors?
  * Nope, just required the standard react library and it gives me all of these awesome error messages
* What is the rationale to returning a function rather than having a function in the button?
  * So that we don't have to use three arrow functions, but absolutely, we could have invoked it immediately within the onClick
* Is there a way to use the buttons text instead of hard coding?
  * Yeah for sure, if there was a ton of them we could do a drop down, store that value and use it in the function call and for the text. But with only three, this is the easiest and best approach to use
* The setState's callback, we did as an arrow function, why is this? Can't we juse put this.fetchConversionRates uninvoked?
  * Yeah absolutely, that's a great point, thank you!
* Does setState return a promise?
  * Not exactly no, we need to pass it a callback
* Why don't you need the parenthesis when calling this.fetchConversionRates anymore in the callback?
  * Because we don't want to invoke it immediately, the setState will invoke it for us as a callback
* Can you explain what setState actually does?
  * It says, if you change a value that's in this object, we will recall the render function so that we update what we are rendering with the new state, if we don't use setState it won't automatically rerender which is troublesome
* Can we name our functions and then export at the end? Or do we have to use export default?
  * Yeah, absolutely. (Shows them how that would look and that it's totally acceptable)
* Is the reason we can't run render() because we aren't extending react?
  * It's because we aren't a class and it doesn't know what a render does. If all we want our functional component to do is return that's what we do: return
* How come we don't need the braces for the arrow function?
  * Using parenthesis we can implicitly return
* Since this isn't a react component, why do we only need to return one element?
  * Every individual component can only return one individual element
  * React will turn this into a component for us (hence functional component)
* In the readings it says we can do bottom up or top down
  * In this case when I was interacting with an API and I knew what I wanted my data to look like, I felt it was easiest to go from the top down. So that we can test as we go. But if bottom up works better for you, by all means that's okay
* Is it good practice to just bind all the functions that you make in the constructor?
  * It was considered best practice until recently, for es2017.
* Why didn't we bind ours?
  * It's being invoked immediately and then the arrow function will close over the args passed in

### Open Forum:
* When we are passing down things as a prop, do they create a plain js object for us?
  * Yes, and we can see what that looks like. (logs the props for them )

### Fix
* Hotfix on Quiz question 6 for Elliot: import statements should be cats_reducer not cats
* Question 5 import statement looked different for them than it did when we went over it?

# W6D5

from FTR: please be explicit about how to debug import/export errors: e.g., if an imported object is undefined
that probably means there's something wrong with the way it's being imported/exported (we really want to push
making them remember when they need to destructure for importing)

## 8 September 2017

* Lecturer: Dallas Hallbert
* Scribe: Isak Mladenoff

### Lecture

#### Questions

* How about the buttons? Why not in their own component?
  * I’ll show you why in a minute.
* Why is rates in curly braces?
  * I’ll show you when we pass it down.
* As far as the naming convention do you capitalize the components?
  * Yep, they are either classes or constructors when you build them out. Also if you put a lower case letter in the Html it will error out.
* Do we need to `setState` and not use `=`?
  * Yes, do not go down this dark path.
* Why does the (some function on the component) not need to have an `e` parameter?
  The e is passed in to the callback.
* Why is it still running even though there are the errors?
  * These are just warnings. If your app was larger it would kill performance.
* If we had the React dev tools we could see the state?
  * Yes.

## Cinco De Mayo, 2017

Lecturer: Gage Newman
Scribe: Kelly Chung

### Lecture Q&A

1. Can you make your own HTML tag?
  + Yes, you totally can. Custom semantic HTML tags are possible.
1. Can props be thought of as HTML attributes?
  + No, but the syntax is very familiar to HTML attributes. It should be
  thought of as something different though
1. Component can't change their own props?
  + That is correct. The flow of information is from top to bottom
1. Is it standard to say `<div id = "root"></div>`?
  + Yes - super standard
1. Whenever you say `npm run`, what happens?
  + Whatever word comes after the command will be checked against
  the package.json to run what you specified.
1. Can we not load all of the babel dependencies together?
  + it's more customizable to load them separately.
1. What's going on with the resolve statement?
  + it allows us to omit extension tags
1. Is there reason the React app isn't working right now because [...]?
  + Yes - I've seeded this file with a couple common mistakes
1. We've imported the `React` file, but don't atually use it.
  + Yes, but we're using syntactic sugar that actually depends on that
  file
1. Can you think of render being implicitly called whenever you see a
component tag in someone's HTML file?
  + Yes
1. There are two different types of import statements according to the
specified export statement from the imported file?
  + Yes
1. Why ES6 import/export over ES5's?
  + It's just nicer and more intuitive. *It's the little things*
1. Claire in the videos last night talked about stateless React
components. Is the function essentially just the render function of a
stateful React component?
  + Yes
1. How does the render function know how to switch between HTML and JS?
  + Let's table that one for now.
1. How do we know what will come out of the response of an AJAX request
we make?
  + Largely, trial and error (and debugging)
1. Setting keys?
  + Keys allow React to be a bit more efficient + provide unique
  identifiers for constituents of a list / collection of elements
1. How does React tell the difference between an HTML element and JSX
element?
  + React components will have a capital letter to name the class and
  will be imported directly from a JSX document.

### Homework + Quiz Q&A

1. Are these componentDidMount functions event listeners?
  + internal to React, but I suppose you can think of them as event
  listeners. Just understand you won't be able to use the events they
  listen to in a more general context

## 3/3/2017-- Jenn

Lecturer: Claire Rogers

### Questions
+ What are props?
+ How do we know when to use functional components?
+ What is the difference between making a data request in `componentDidMount` vs in the constructor function?
+ How to write success callbacks for ajax requests with es6 syntax
+ What is the difference between binding functions in the constructor vs binding locally?
+ When do we need to bind?
+ How to destructure props
+ How to dynamically apply css classnames
+ Why not use jQuery?
+ Do we have to name the files `.jsx`?
+ What happens if you have two items of the same value? (Context: key values in mappings)
+ Why don't we just iterate over the object instead of using `Object.keys`?
+ Don't we have some extra renders in the example with the two setStates?
+ If React renders but nothing changed, does anything change?
+ Does React have access to semantic (HTML 5) tags?
+ Does Facebook maintain React/is it open source?
+ Are we rendering on the same exact instance of the class each time?
* How are react lifecycle methods given to classes?
* How can functional components have props if they are purely functional?
* Why doesn't your webpack throw version errors?
* When we render a jsx element, why is it inside html tags?
  * student was confused why we do `< Widget />` instead of just `Widget` in `ReactDOM.render`
* Why are we wrapping in a `div` and not more semantic tags?
* If you have JS turned off in your browser, would the page always say `I am root`?
* Does `%w` exist in JS?
* Can we see the `key` property inline in the DOM?
* Do key props have to unique throughout the whole app?
* How do I return a component (defined in another file) inside of another
  components `render` method?
* Instead of passing a value to the click handler function, can we instead use
  `e.target.value`
  * Is this preferred over passing through a value?
* Which style of passing arugments is preferred: using bind or embedding an arrow
  function?
* Instead of fetching rates as a callback to set state, could we just chain it
  to the Instead of fetching rates as a callback to set state, could we just chain it
  to the `.then` on the ajax request?
* Why is the cursor not changing to a pointer when we hover over a currency?  
  How can we change it?


### Mistakes
+ Confused about props and binding


### Notes
+ I have a currency demo I have done several times for this lecture
+ Runs through functional components, class components, props, state, lifecycle methods, import/export syntax.  
+ There were no questions from the previous day's projects
+ There were a few questions on how to access an input's value from the homework

## 12/23/2016
## 10/21/2016
