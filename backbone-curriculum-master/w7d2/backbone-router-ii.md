# Backbone.Router II

## `listenTo` and zombie views

Nobody likes zombies.

Let's survey a common problem. Consider the following router:

```javascript
JournalApp.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index",
    "posts/:id": "show",
  },

  index: function () {
    var indexView = new JournalApp.Views.IndexPosts({
      collection: JournalApp.posts
    });

    this.$rootEl.html(indexView.render().$el);
  },

  show: function (id) {
    var post = JournalApp.posts.get(id);
    var showView = new JournalApp.Views.ShowPost({
      model: post
    });

    this.$rootEl.html(showView.render().$el);
  }
});
```

Say that the index view renders a link to `#/posts/123`. If we click
that link, we will invoke the `show` action in `Routers.Posts`. This
builds a new view, renders it, and then replaces the content of the
page with the `ShowPost` content.

What happens to the old `PostsIndex` view? We removed its `$el` from
the DOM in the last line of the `show` action (this replaced
`indexView.$el` with `showView.$el`). Since the old index view is no
longer in the DOM, it should be garbage collected. If we visit the
`index` route again, we'll build a new `PostsIndex` to replace the
`ShowPost` page.

## Old views never die...

Garbage collecting disused objects is important: holding on to
unnecessary data is wasteful. Each JavaScript object takes up memory,
and if you continuously use more-and-more memory, eventually the
browser begins to slow down.

If you aren't careful, your views will not be garbage collected. The
problem arises because views often listen for events.

Let's take the `PostsIndex`, for instance:

```javascript
JournalApp.Views.PostsIndex = Backbone.View.extend({
  // ...

  initialize: function () {
    var that = this;

    var events = ["add", "change:title", "remove", "reset"];
    _(events).each(function (event) {
      that.listenTo(that.collection, event, that.render);
    });
  },

  // ...
});
```

In order to re-render the index view when new objects are
added/removed/etc from the collection, we set a callback
(`that.render`; `listenTo` will bind the function to the view). To
implement this functionality, Backbone will store the callback
function in the collection class. Whenever one of these events occurs
to the collection, it will iterate through the installed event
handlers, calling each one.

This means that the collection holds a reference to the view, via the
callback. The collection holds the callback, which references the
view, so as long as the collection is in use, the `PostsIndex` view
cannot be garbage collected.

We can remove the callback. We need to do this when we are done with
the `PostsIndex`, otherwise it will never be garbage collected. The
way to do so is to call `stopListening` on the view
object. `stopListening` removes all callbacks that were installed via
`listenTo`. Always prefer `listenTo` to `on` for this reason.

As a convenience, because `stopListening` is usually called at the
same time we remove a view from the DOM, Backbone provides a single
method, `Backbone.View#remove`:

```javascript
// Remove this view by taking the element out of the DOM, and removing any
// applicable Backbone.Events listeners.
remove: function() {
  this.$el.remove();
  this.stopListening();
  return this;
},
```

## A Swapping Router

A common method to write for a Backbone Router is `_swapView`. This
should, given a new view to render, first call `remove` on the old
view. This makes sure to not only remove the old view from the DOM,
but also to remove any event handlers.

Here's an implementation:

```javascript
_swapView: function (newView) {
  this._currentView && this._currentView.remove();
  this._currentView = newView;
  this.$rootEl.html(newView.$el);
  newView.render();
}
```

If you only display new views in your router through calls to
`_swapView`, you will be guaranteed that the previous view is properly
cleaned up and removed each time.
