# Backbone.View II

## `remove`

`remove` removes the view from the DOM and calls `stopListening` which 
unregisters the event handlers registered by `listenTo`. Most commonly `remove` 
will be called in the `_swapView` of a swapping router.

```js
_swapView: function (view) {
  this._currentView && this._currentView.remove();
  this._currentView = view;
  this.$rootEl.html(view.$el);
  view.render();
}
```

**NB**: If a view has rendered a subview, `remove` will not call
`stopListening` on the subview.

## CompositeViews and `leave`

When a view renders subviews it is often called a CompositeView. When removing 
a CompositeView it's important to ensure each child view is also removed.

In _Backbone.js on Rails_ by Thoughtbot, they discuss a pattern for removing all 
children when a composite view is removed. The basic idea is to abstract access 
to the remove method and iterate through the children calling leave. 
Check it out:

```js
// subview
BackboneExample.Views.ExampleItem = Backbone.View.extend({
  tagName: 'li',
  template: JST['examples/item'],
  render: function () {
    var content = this.template({ example: this.model });
    this.$el.html(content);
    return this;
  },
  leave: function () {
    this.remove();
  }
});
// composite view
BackboneExample.Views.ExamplesIndex = Backbone.View.extend({
  tagName: 'ul',
  template: JST['examples/index'],
  initialize: function (attribute) {
    this.subViews = [];
  },
  render: function () {
    var content = this.template();
    this.$el.html(content);
    var that = this;
    this.collection.each(function (example) {
      var view = new BackboneExample.Views.ExampleItem({ model: example });
      that.subViews.push(view);
      that.$el.append(view.render().$el);
    });
    return this;
  },
  leave: function () {
    this.subViews.forEach(function (subView) {
      subView.leave();
    });
    this.remove();
  }
});
```

## `tagName`

We know that each view references a DOM element via `el` and `$el`. By default 
the element is an empty `<div>`. The `tagName` attribute of a Backbone.View 
will override the type of tag.

```js
BackboneExample.Views.ExampleForm = Backbone.View.extend({
  tagName: 'form' // sets $el type to <form>
});
```

## `className`

Setting the `className` attribute of a Backbone.View will add a class to the 
DOM element referenced by `el` and `$el`.

```js
BackboneExample.Views.ExampleForm = Backbone.View.extend({
  tagName: 'form', // sets $el type to <form>
  className: 'special' // sets $el class to <form class="special">
});
```

## `attributes`

The `attributes` property of Backbone.View is a hash of attributes that will be 
set as the DOM element's properties.

```js
BackboneExample.Views.ExampleForm = Backbone.View.extend({
  tagName: 'form', // sets $el type to <form>
  className: 'special', // sets $el class to <form class="special">
  attributes: {
    'enctype': 'multipart/form-data'
  }
});
```

## `this.$el.find` short hand

Many times you will search through the `el` of the view using 
`this.$el.find(selector)`. Backbone gives us a nice shorthand for this. We can 
simply use `this.$(selector)` instead.
