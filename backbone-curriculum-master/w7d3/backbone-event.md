# Backbone.Event

Backbone.Events is a module that can be mixed in to any object. Many of the 
Backbone objects mixin Events and give the object the ability to bind and 
trigger events. There are a few built in events and you can create custom named 
events.

## `listenTo`
`listenTo` tells an object to listen to an event on another object and fire a 
callback when that event occurs. Let's take a look.

```js
BackboneExample.Views.ExampleDetail = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "change:title remove", this.render);
  },
  render: function () { console.log("rendering!"); }
});
var example = new BackboneExample.Models.Example({ title: 'title' });
var view = new BackboneExample.Views.ExampleDetail({ model: example });
example.set({ title: "new title" });
//=> "rendering!"
```

`listenTo` will automatically bind `this` to the context of the object that is 
listening for the callback. 

**Why not just use other.on(event, callback, object) ?**: `listenTo` will keep 
track of the events registered and can remove them all at once later on. If we use
`on` when we `remove` the view, there will still be events registered to the view,
which will prevent the view from being garbage collected, which will cause memory leaks
and potentially other unwanted behavior. 

## Built-in Events (from backbone docs)

The arguments in parentheses will be passed to the callback when the event is triggered.

+  "add" (model, collection, options) — when a model is added to a collection.
+  "remove" (model, collection, options) — when a model is removed from a collection.
+  "reset" (collection, options) — when the collection's entire contents have been replaced.
+  "sort" (collection, options) — when the collection has been re-sorted.
+  "change" (model, options) — when a model's attributes have changed.
+  "change:[attribute]" (model, value, options) — when a specific attribute has been updated.
+  "destroy" (model, collection, options) — when a model is destroyed.
+  "request" (model, xhr, options) — when a model (or collection) has started a request to the server.
+  "sync" (model, resp, options) — when a model (or collection) has been successfully synced with the server.
+  "error" (model, xhr, options) — when a model's save call fails on the server.
+  "invalid" (model, error, options) — when a model's validation fails on the client.
+  "route:[name]" (params) — Fired by the router when a specific route is matched.
+  "route" (route, params) — Fired by the router when any route has been matched.
+  "route" (router, route, params) — Fired by history when any route has been matched.
+  "all" — this special event fires for any triggered event, passing the event name as the first argument.

## Resources
+  [Backbonejs.org](http://backbonejs.org/#Events)
