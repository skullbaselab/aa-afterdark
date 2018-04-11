# Backbone.Collection

Collections wrap sets of models, add handy [underscore.js][underscorejs]
"enumerable" methods, and enable binding to events for notifications as
things change in the collection.

[underscorejs]: http://underscorejs.org/

## Setup

Basic collection setup:

```js
BackboneExample.Collections.Examples = Backbone.Collection.extend({
  model: BackboneExample.Models.Example,
  url: "/api/examples",
  initialize: function (models, options) {}
});
```

### `model`

The model property specifies the model class that the collection contains.
Defining this attribute allows us to pass raw attributes, and arrays of raw
attributes when creating collections and the attributes will be converted to
models of the proper type.

### `url`

The url method of the collection defines the location of the RESTful resource on
the server. This will be the route to our rails api for the index action of that
resource.

### `initialize`

Collections can be initialized with an optional array of models. You may also
pass options to the constructor.

## Use

### `models`
To access the models of a collection manually you may want to call
`coll.models`. Typically access to models is done through `get(id)` or
`at(index)`.

```js
BackboneExample.Collections.Examples = Backbone.Collection.extend({
  model: BackboneExample.Models.Example,
  url: "/api/examples"
});
var examples = new BackboneExample.Collections.Examples([{ title: "First Ex" }]);
console.log(examples.models.length); // => 1
```

## Collection methods and the things they do (summary)

Some backbone collection methods provide convenient wrappers for
making common `$.ajax` requests:

| Backbone Collection Method  | makes this HTTP request that | calls this Rails controller method |
| --------------------------- | ---------------------------- | ---------------------------------- |
| `fetch`                     | `GET`                        | `controller#index`                 |
| `create` passing in a hash of new model attributes  | `POST` | `controller#create` (and on success, adds new model to Backbone collection.)  |

### `fetch`

`fetch` is an **async** operation that will send an $.ajax request to `url` to
get models from the server. `fetch` takes an optional options hash that may
include success and error callbacks.

```js
var examples = new BackboneExample.Collections.Examples();
console.log(examples.models.length); // => 0
examples.fetch({
  success: function(collection, resp, options) { // 7 examples back from server
    console.log(examples.models.length); // => 7
  },
  error: function(collection, resp, options) {}
});
```
### `create`

`create` is also an **async** operation, and it sends an $.ajax `POST` request
to `url`, creating an instance of the model, as well as adding it to the
collection.  It is equivalent to creating a model, calling `save` on the model,
and then adding it to the collection in the `success` callback for `save`.


## Resources
+  [Backbonejs.org](http://backbonejs.org/#Collection)

[underscorejs]: http://underscorejs.org/
