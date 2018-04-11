# W7D3 Flux

---

## Overview
+ Questions from the Questions
+ Flux Overview
+ Stores
+ Views
+ Actions
+ Dispatcher
+ Flux on Rails
+ Complicated Syntax
+ Demo

---

# Solutions Questions

---

## Flux Overview
+ see [the diagram](https://github.com/appacademy/react-flux-curriculum/raw/master/w7d3/flux-diagram.png)

---

## Stores
+ is an `EventEmitter` - simple object that stores callbacks and can trigger events
+ holds the data, no rules on what it can be, array, hash, whatever
+ emits events, signaling views to get fresh data
+ can only be changed by actions from the dispatcher
+ registers its self with the Dispatcher upon definition

---

## Views
+ normal react views, nothing different
+ get data from stores, listen for events emitted by stores
+ user input causes actions to be created/dispatched

---

## Actions
+ just POJOs, their purpose is to be distributed to stores by the dispatcher
+ user input (submitting forms, clicking delete buttons) usually the reason
+ dispatched to ALL stores, individual stores decide whether they care
+ need an `actionType` property so a store can decide if it cares or not

---

## Dispatcher
+ ALL actions from ALL views flow here and are sent to ALL stores
+ central hub of information
+ a registry of callbacks to the stores

---

## Flux on Rails
+ `gem 'flux-rails-assets'` - this gives us EventEmitter and Dispatcher
+ Store should extend the `EventEmitter` prototype
+ Dispatcher is merely a `new` instance of `FluxDispatcher`
+ add `//= require eventemitter` and `//= require flux` to `application.js`

---

## Complicated Syntax
+ jk, lol

---

# FIN

---

## Demo
+ draw each piece of puzzle on board while working
+ add `flux-rails-assets` and lines to gemfile
+ store -> EventEmitter, use constant instead of string
+ add dispatcher, register store
+ test dispatcher with simple alert and action type
+ ready store to reset and create recipes with actions
+ move api stuff to api util, have it create actions
+ strings action names need to be in sync -> make recipe constants
+ move action creation to RecipeActions
