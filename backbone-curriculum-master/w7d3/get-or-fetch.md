# Get or Fetch

Backbone collections have a `get` method that will retrieve a model by
`id`. This is convenient if we have the model in our client-side
collection, but sometimes we want a model that only exists on the
server. In this case, we need to create a model with the desired `id`
and fetch it. We could do this wherever we need the model, but this
would involve a lot of code duplication; instead, we should define an
interface on the collection that will manage this process.

The pattern we will use is `getOrFetch`:

```js
// app/assets/javascripts/collections/widgets.js

AppName.Collections.Widgets = Backbone.Collection.extend({
  // ...

  getOrFetch: function (id) {
    var collection = this;
    var widget = collection.get(id);

    if (widget) {
      widget.fetch();
    } else {
      widget = new collection.model({ id: id });
      collection.add(widget);
      widget.fetch({
        error: function () { collection.remove(widget); }
      });
    }

    return widget;
  }
});
```

## Code Explanation

Let's go through the code slowly:

```js
var collection = this;
var widget = collection.get(id);
```

The first two lines set up the rest of the function: we store the value
of `this` for later reference in a callback, and we try to retrieve the
model from the collection.

```js
if (widget) {
  widget.fetch();
}
```

If a model with the correct `id` already exists in our Backbone
collection, then we're pretty much done. We do want to fetch the model,
however. There might be updates on the server, and we frequently send
more data from a `show` route than from an `index`.

```js
} else {
  widget = new collection.model({ id: id });
  collection.add(widget);
  widget.fetch({
    error: function () { collection.remove(widget); }
  });
}
```

If `collection.get(id)` returned `undefined` (because our Backbone
collection didn't contain a model with the `id` in question), then we
need to instantiate a model with that `id`, fetch it, add it to the
collection. If we receive an error when fetching the model from the
server, then we'll remove it from the collection.

This might feel dirty on a gut level, but it's important to do things in
this order. If we wait for a `success` callback to add our model to the collection,
then there's a window where a model with the same id could be added to
the collection (say, as the result of a `collection.fetch`). If this
happens, then the model returned by getOrFetch won't actually be a
member of the collection, rendering our work useless. Read the [fine
print here][backbone-collection-add] for more detail.

[backbone-collection-add]: http://backbonejs.org/#Collection-add

```js
return widget;
```

Note that `Backbone.Model#fetch` is asynchronous, so when we `return
widget` from `getOrFetch`, the model returned might have only an `id`
attribute, or an incomplete set of attributes, or outdated attributes.
Whichever attributes are available will then be used by some view to
render content onto the page, or your view might simply render the text
"Loading..." or a cool [CSS spinner][css-spinner]. Whatever we render
while we wait for the server's response, we definitely want to re-render
our view once that response does come back.

This is where `listenTo` comes in. Whichever view is using the model
returned by `getOrFetch` should `listenTo` a `'sync'` event on the
model. When the asynchronous `fetch` completes, it will trigger a `sync`
event, which the view should respond to by re-rendering.

[css-spinner]: http://google.com/search?q=css+spinner

## Always fetch

Note that the `getOrFetch` name is a little misleading, since we will be
`fetch`ing the model in both branches of our `if...else` statement.
Despite the questionable name, we're going to stick with it for reasons
of backwards-compatibility with the videos, but you might prefer to
think of the method as `getAndFetch` or `getOrInstantiate`.
