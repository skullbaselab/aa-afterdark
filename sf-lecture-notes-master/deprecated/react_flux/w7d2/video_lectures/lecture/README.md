# W7D2
---

## Agenda
* Common Mistakes (5 min)
* Questions from yesterday's assignment (10 min)
* Today's learning goals (5 min)
* Quiz Solution (5 min)    
* Questions from the homework (10 min)
* Today's Material (60 min)
---

## Common Mistakes (5 min)
  * Props vs State
  * When to bind component functions

---

## Questions from yesterday’s assignment (15 min)

---

## Today's Learning Priorities (5 min)
* Props and state
* Reconciliation
* Lifecycle methods
* Stores
* Rails and React


---

## Quiz Solution (5 min)
    * [solutions](https://github.com/appacademy/daily-quiz/blob/master/react-flux/w7d2.md)

---

## Homework Questions (10 min)

---

## New Material (60 min)

---

## Props and State
* There are two ways of making components render content dynamically
    1. props
    2. state
* The difference between them is where they come from and what you can do with
    them
    * Props come from the parent
    * State comes from inside the component
    * A component can't change its props since it is passed down
    * A component can change its state using `this.setState`
* General rules
    * Don't create state if you don't have to
    * Don't create state for the same data, move it up the tree
    * Don't create state from props

---

## Reconciliation
* Virtual DOM
* Pairwise-diffing and list-wise diffing
  * DOM Nodes vs Custom components

---
## Lifecycle methods
* Lifecycle demo

---

## Stores
* Separation the data and data logic from the presentation logic is good 
separation of concerns.
* Gives us as opportunity down the line to re-use code that is common to all
  stores

---
## Rails and React
* How do they communicate?
* Rails gives client React App and an HTML page
* Rails goes on to serve other clients or chill
* React does it thing on the client side
* React asks Rails server for more information if necessary

---
## Rails and React Demo

---
