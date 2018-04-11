# Backbone.View

Backbone.Views are used to organize the user interface into logical views that
are backed by data (models or collections). The best pattern to follow is to
allow your view to render (without redrawing the entire page) whenever the data
being displayed by the view changes.

## Setup

At a minimum an index view will look like this:

```js
BackboneExample.Views.ExamplesIndex = Backbone.View.extend({
  template: JST['examples/index'],
  render: function () {
    var content = this.template({ examples: this.collection });
    this.$el.html(content);
    return this;
  }
});
```

### `template`

The `template` property of a Backbone.View is a good place to store a template
function. We will be using JST (JavaScript templates) but you could use any
templating engine here. `template` takes an object where the keys will specify
the names of the local variables and the values are the values of the variables.
Lucky for us, JST looks and feels just like ERB.

```html
<!-- app/assets/templates/examples/index.jst.ejs -->
<h1><%= examples.first().escape('title') %></h1>
```

```js
var content = this.template({ examples: this.collection });
console.log(content); // => "<h1>First Ex.</h1>"
```

### `render`

One primary responsibility of a view is to "render" content into an element on the DOM.
`render` should:

1.  Compile the template into content
2.  Inject the content into the $el using html or append (we'll look at $el in a sec)
3.  `return this`. (by returning the view we can have convenient chaining)

## Use

### `initialize`

When instantiating a view, you may pass an options hash as an argument.
Certain keys, if provided in the options hash, will automatically be set
as instance variables of the view, most commonly `model`, `collection`,
and/or `el`. Other values passed to the constructor in the options hash
will need to be manually stored as instance variables in the view's
`initialize` method. **NB**: The other major purpose of the `initialize`
method is setting up the view's listeners.

```js
BackboneExample.Views.ExamplesIndex = Backbone.View.extend({
  initialize: function (options) {
    this.exampleStyle = options.exampleStyle;
    this.listenTo(this.collection, "reset add", this.render);
  },
});

var view = new BackboneExample.Views.ExamplesIndex({
  collection: BackboneExample.examples, // top level collection of posts
  exampleStyle: "fun"
});
```

**NB**: We do not need to set up the collection object in the `initialize`
method because `collection` is one of the "special" options we may pass.

### `$el` and `el`

Each Backbone.View has reference to an html element that will be used to
represent the view on the page. `el` will by default be created as an empty
`div`. `el` will hold a reference to the html element, while `$el` will hold
a cached jQuery object for the view's html. Prefer using the `$el` as it will
have all of the jQuery methods we've grown to know and love.

```js
var view = new BackboneExample.Views.ExamplesIndex({
  collection: BackboneExample.examples, // top level collection of posts
  exampleStyle: "fun"
});
$('body').html(view.render().$el);
```

### `events`

The `events` hash is used with jQuery's `on` function to register callbacks to
DOM events. The event hash should look like this:

```js
events: {
  'event selector': 'callbackName'
}
```

Why not just manually bind these events in the initialize of the view?

```js
// WRONG:BAD:DONT DO
initialize: function () {
  $('div.fancy-class').on('click', this.handleFancyClick, this);
  $('#fancy-form').on('click', this.submitFancyForm, this);
}
// CORRECT
events: {
  'click div.fancy-class': 'handleFancyClick',
  'submit #fancy-form': 'submitFancyForm'
}
```

Prefer using the events hash as it will correctly _bind_ and more importantly
_unbind_ these event handlers.

## Resources
+  [Backbonejs.org](http://backbonejs.org/#View)
