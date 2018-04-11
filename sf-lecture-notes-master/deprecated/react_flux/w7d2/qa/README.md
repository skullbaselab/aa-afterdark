# W7D2 React + Rails

---

## Pre-Overview
+ Read Overview Bullet Points

---

## Overview
+ Solutions Questions
+ React Gotchas
+ Lifecycle Methods
+ Component Design
+ Props vs State
+ Forms and Inputs
+ React and Rails

---

# Solutions Questions

---

## React Gotchas
+ bind - ONLY instance methods, `map` or `forEach` callbacks need to be bound
+ `setState` - NOT synchronous!
+ state - if you can derive it from props/other state, it shouldn't be state!
+ `/* global React */` so JSHint stops complaining about React

---

## Lifecycle Methods
+ componentWillMount
+ componentDidMount - invoked after initial render, do set up stuff here like
  async api calls, set timeouts and intervals, etc
+ componentWillReceiveProps - invoked every time new props arrive
+ shouldComponentUpdate - can return false if you don't want to render, but don't
+ componentWillUpdate, componentDidUpdate
+ componentWillUnmount - disconnect event handlers, stop intervals, etc

---

## Component Design
+ diagrams are always helpful: draw boxes around the logical groups
+ each box will become a component!
+ arrange them in a hierarchy: who renders who?
+ how do props flow from top to bottom?
+ keep it DRY! keep state minimal, not redundant, not from props

---

## Component Design Cont.
+ identify minimal state:
  + does it come from a parent?
  + is it static over time?
  + can you compute it based on other state/props?
  + if any of these are true, it's NOT STATE
+ put state in common owner component
+ finally add reverse data flow: callbacks in elements nodes to parents

---

## Props vs. State
+ most components will just render props
+ user input, passage of time, async request success all can necessitate state
+ component's event handler's will likely change state
+ state shouldn't contain computed data from props/state or other components

---

## Forms and Inputs
+ I recommend having controlled components: all inputs value's are in state
+ input values always match state
+ really easy for submitting form, no annoying scraping
+ `LinkedStateMixin` - to help DRY out value/handler callback code

---

## React and Rails
+ official gem: `react-rails`, `rails g react:install`
+ put components into `app/assets/javascripts/components/`, `js.jsx` extension
+ compiled on server

---

# End :)
