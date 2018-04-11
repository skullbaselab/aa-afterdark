# React Day 1 Lecture Prep

At this point, students are halfway through the course. Some stronger students
are beginning to burn out from the intensity. React and Redux (the lights at
the end of the instructional tunnel) are the final major technologies that
students need in order to create amazing Full-Stack Projects.

That being said, JavaScript was very new to many students. Some students
prioritize studying for the JavaScript assesment over completing their in-class
projects, homeworks, and readings. These students will likely struggle with
basic AJAX/XHR - the arteries and veins of full-stack (and even front-end-only)
applications.

## Topics Covered in Readings/Materials

+ NPM - Initializing a package.json and installing packages
+ Webpack - VERY basic config
+ [Advanced Object Destructuring](https://github.com/appacademy/curriculum/blob/master/react/readings/object_destructuring.md)
+ ES6 Import/Export
+ React Dev Tools
+ Intro to React
  + Making a basic component
  + The root component
  + Babel
+ Functional Components
+ Lifecycle Methods

## Topics Covered in the Homework

+ Getting Started with NPM
  + Basic project initialization
  + Setting up webpack
+ React Calculator
  + Modifying `this.state` using an `onClick` handler
  + Basic project structure

## Topics Covered in Today's Projects

+ Widgets
  + Using an AJAX call to dynamically change page content.
+ Minesweeper
  + React-ified OOP

## Preparing to Lecture

### Background

+ Videos
  + [All the feels](https://www.youtube.com/watch?v=BYbgopx44vo)
  + [Intro to React.js (FB)](https://www.youtube.com/watch?v=XxVg_s8xAms)
+ General
  + [React.Component (FB)](https://reactjs.org/docs/react-component.html)
  + [React Components, Elements, and Instances - Dan Abramov](https://medium.com/@dan_abramov/react-components-elements-and-instances-90800811f8ca)
+ Lifecycle
  + [React Lifecycle Methods and When to Use Them](https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1)
+ Virtual DOM
  + [Virtual DOM (FB)](https://reactjs.org/docs/faq-internals.html)
+ Reconciliation
  + [Reconciliation (FB)](https://reactjs.org/docs/reconciliation.html)
  + [Avoiding Reconciliation and shouldComponentUpdate](https://reactjs.org/docs/optimizing-performance.html#avoid-reconciliation)


The best way to prepare for this lecture is to practice the webpack and
currency converter code demos.
Practice explaining each part of the setup in ways that relate back to the
previous day's project.
(They now know what `document.getElementById()` does.
Explain how ReactDOM replaces the innerHTML with new HTML generated from JSX).

Practice explaining the concept of components and be able to justify the idea
that components should follow the single-responsibility-rule.

Ask how we would have done this same thing in vanilla JavaScript or with jQuery.

## Lecture Notes

With any lecture, you will want a written outline of what you will be covering,
your slide topics, and any code demos you will be covering (just in case yo
 make a typo or get side-tracked). Below is an example outline you might use for
this lecture:

### Currency Widget

+ Big Picture/Overview
  + How to `Think In React` through the slides
  + Show the HTML
  + make `frontend` folder and say this is how Rails will structure it
  + Change your entry in `webpack.config.js` to `./frontend/entry.jsx`
+ Demo the api call to show the structure of the data
  + Make sure to show the `responseJSON`
+ From here on out, feel free to litter code with `console.log` and `debugger`
to show them what's going on (like showing props, state, etc)
+ Entry
  + Creat entry without `Widget`, use `h1`
  + Then import the `Widget`
  + Test
+ Widget Component
  + Discuss with students if this should be a functional or class component
  + write the `constructor` and a basic `render` with buttons and headers
  + Test
  + Add the `onClick` attributes to each button
  + Make sure that all three ways are shown (see the solution)
  + Show the state changes
  + Now write the AJAX request function
  + Use a `.then` to `console.log` the `response` variable and show that it is
the `responseJSON`.
  + Add `setState` to the `.then` and put it as the callback to all other
`setState`s
+ CurrencyIndex Component
  + Render it in the Widget
  + Discuss with the class whether it should be a functional or class component
  + Info will come from props, so no state. Functional is good!
  + Render a list of `li`s and test
+ Exchange Index Items
  + Explain why we need to re-render
    + This is getting convoluted and we want to add even more functionality to
this component
  + Refactor it out
  + Test
  + If time, add colors! It's quick and the students really like this

