# Backbone.Model

Models contain the data of our application as well as any logic surrounding it
including conversions, validations and computed properties. We will extend
Backbone.Model to get basic functionality for managing and listening to
changes to the data.

At first our model will look like this:

```js
BackboneExample.Models.Example = Backbone.Model.extend({});
```

## `initialize`
Backbone models can have an initialize method that takes JSON attributes as
arguments and will set these attributes on the model.

```js
// will set the title and id attributes of example
var example = new BackboneExample.Models.Example({ title: "First Ex.", id: 1 });
```

## `get` and `set`
Backbone Models have `get` and `set` methods that allow us to access the model's
data which is stored in an `attributes` JSON object. Like ActiveRecord models,
all the essential data for a Backbone model is stored in an internal object
called `attributes`. Where ActiveRecord provides us getter and setter methods
for each attribute that abstract away access to `attributes`, Backbone models
provide access through `get` and `set`.

**NB**: Never access the attributes object directly. Interaction with
`attributes` is abstracted away so that Backbone can expose events like changing
the title. If we change the title via the `attributes` object we lose that power.

```js
var example = new BackboneExample.Models.Example({ title: "First Ex.", id: 1 });
console.log(example.get('title')); // => "First Ex."
example.set({ title: "New Title" });
console.log(example.get('title')); // => "New Title"
```

## `escape`
When model data is being displayed in a view prefer escape over get as it will
safely html escape data.

```js
var example = new BackboneExample.Models.Example({
  title: "<script>hack()</script>", id: 1
});
// not safe
console.log(example.get('title')); // => "<script>hack()</script>"
// safer
console.log(example.escape('title')); // => "&lt;script&gt;hack()&lt;&#x2F;script&gt;"
```

## `id` vs `cid`
`id` is a special attribute of Model that maps to the `id` attribute in the
`attributes` object. `id` is special because it can be accessed directly using
the dot notation (`example.id`). The `id` attribute is used to determine if a
model `isNew` or not (backbone will figure out whether to send PUT or POST based
on `isNew`)

`cid` is an attribute added to all Models and is used to uniquely identify Models
on the client side. All `cid`'s will be prefixed with a `c`. This will come in
handy when needing to display things on the client side by unique id, without
having an id returned from the server.

## Model methods and the things they do (summary)

Some backbone model methods provide convenient wrappers for
making common `$.ajax` requests:

| Backbone Model Method  | makes this HTTP request that | calls this Rails controller method |
| ---------------------- | ---------------------------- | ---------------------------------- |
| `save` on a model with no id  | `POST`                | `controller#create`                |
| `save` on a model that has an id  | `PUT`             | `controller#update`                |
| `save` on model with id using `{ patch: true }` option | `PATCH` | `controller#update`     |
| `fetch` on a model that has an id | `GET`             | `controller#show`                  |
| `destroy` on a model that has an id | `DELETE`        | `controller#destroy`               |

## `save`

`save` is a method that will make a `$.ajax` request to your rails controller
using the model `url` or `urlRoot` attribute.  It will either make a `POST`,
`PUT`, or `PATCH` request depending on whether the model has an id and what
options you pass in.

Examples:

```javascript
BackboneExample.Models.Example = Backbone.Model.extend({
  urlRoot: 'api/examples/'
});

var example = new BackboneExample.Models.Example();
example.save({ title: "Example title" }, {
  success: function(model, response, options){
  //the success callback recieves the model itself as it's first argument
  },
  error: function(model, response, options){
  //in the error callback, the response argument will have info about the error
  }
});
// a successful save of a new model will create a record in the Rails database
// AND set the attributes of 'example` to the saved attributes on the javascript side.
```

Notice the first argument of `save` is a JS object containing any attributes
you want to save.  If you have already set the attributes on the model, then
just pass an empty object as the first argument.

## `fetch`

`fetch`, when called on a Backbone model which has an `id`, will make an
`$.ajax` request that goes to the controller's `show` method.  On success, it
sets the attributes of the model to the response sent by your Rails controller.

```javascript
BackboneExample.Models.Example = Backbone.Model.extend({
  urlRoot: 'api/examples/'
});

var example = new BackboneExample.Models.Example({ id: 1 });
// The model must have an id - otherwise Rails doesn't know what to fetch
example.fetch({
  success: function(model, response, options){
  //the success callback receives the model itself as it's first argument
  },
  error: function(model, response, options){
  //in the error callback, the response argument will have info about the error
  }
});
// a successful fetch sets the attributes of `example` to match the record in
// your Rails database.
```

## `destroy`

`destroy` makes an `$.ajax` request of type `DELETE`, hitting your Rails controller's `destroy`
method and deleting the record from your Rails database.

```javascript
BackboneExample.Models.Example = Backbone.Model.extend({
  urlRoot: 'api/examples/'
});

var example = new BackboneExample.Models.Example({ id: 1 });
// The model must have an id - otherwise Rails doesn't know what to destroy
example.destroy({
  success: function(model, response, options){
  //the success callback recieves the model itself as its first argument
  },
  error: function(model, response, options){
  //in the error callback, the response argument will have info about the error
  }
});
// a successful destroy will destroy the matching record in your Rails database.
// It doesn't actually destroy the javascript object locally on success.
```


# Resources

+  [Backbonejs.org](http://backbonejs.org/#Model)
+  [Rails namespaces your Backbone JSON](http://stackoverflow.com/questions/9133652/rails-3-params-unwanted-wrapping)
