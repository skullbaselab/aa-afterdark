# w5d1 Flux Day 1

### Intro to Flux
* review of todos
* two-way binding
* architecture developed by Facebook, data flows in only one direction
* Stores, Views, Action Creators/Actions, Dispatcher, these are the key
  components
* dispatcher - central hub of data flow, a registry of callbacks into
  stores. When an action is created the dispatcher sends the message to
  all the stores so they can do with it as they please.
* Views - react views
* Actions/Action Creators - views trigger actions (make objects to
  dispatch to stores). This is the mechanism that allows views to change
  stores. Action Creator methods help make the action objects.

# Lecture
* draw diagram on whiteboard
* talk about each piece
* take recipes example and add rest of flux structure
* add `flux-rails-assets` to gemfile and explain what it is
* https://github.com/stefanritter/flux-rails-assets
* add the following to `application.js`

```
  //= require flux
  //= require eventemitter
```
* create the dispatcher, it is the center piece
* `AppDispatcher = new FluxDispatcher()`
* register a callback with the dispatcher, should `switch` on `type`
* case `RECIPES_RECEIVED`, call `_sync` which should now become private
* this way ONLY an action could change the store
* also call `changed` so an event is emitted
* view should still work, interface hasn't changed
* update api util to use the dispatcher instead of talking to the store
* then make an action creator so the api util uses that instead
* finally make the constants and use those everywhere, should have
  everything now
* add delete functionality through the whole stack
