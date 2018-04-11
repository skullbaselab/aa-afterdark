# Backbone.Model II

## `parse`

`parse` is a method of both Backbone.Model and Backbone.Collection. It
is the method called whenever **data is returned by the
server**. Think of this as the method for sanitizing data **incoming
from the server to the client**.

`parse` is passed the raw response object and should return the
attributes hash to be set on the model. Override `parse` when working
with nested data from the server.

```js
//app/assets/javascripts/models/todo.js
window.Todo.Models.Todo = Backbone.Model.extend({
  urlRoot: "/api/todos",
  parse: function (jsonResp) {
    // The jsonResp from /api/todos returns nested comments under each
    // todo model. Rather than keep a `comments` attribute on the model
    // containing array of json objects, it's better to create a Backbone
    // Collection and store the nested objects as Backbone Models.
    if (jsonResp.comments) {
      this.comments().set(jsonResp.comments);
      delete jsonResp.comments;
    }
    return jsonResp;
  },

  // used for memoizing the related TodoComments Collection.
  comments: function () {
    if (!this._comments) {
      this._comments = new Todo.Collections.TodoComments([], {
        todo: this
      });
    }
    return this._comments;
  }
});
```

`set` has an optional options hash as a second argument. If you pass in `parse:
 true` through the options hash, `set` will use its `parse` method. This is
  very useful for dealing with data nested more than one level deep.

```js
window.EX.Models.RecursiveExample = Backbone.Model.extend({
  parse: function (resp) {
    // RecursiveExample can have a child attribute of class RecursiveExample.
    // This can be nested to arbitrary depth, which makes recursion tractable.
    // By default, calling `set` will simply set the attributes
    // Use `parse: true` to recursively use the child's `parse` method
    if (resp.child) {
      this.child().set(resp.child, {parse: true});
      delete resp.child
    }
    return resp;
  },

  // memoize the child model
  child: function () {
    if (!this._child) {
      this._child = new EX.Models.RecursiveExample( { parent: this } );
    }
    return this._child;
  }
});
```

## `toJSON`

Similar to `parse`, `toJSON` is a method of both Backbone.Model and
Backbone.Collection. It is the method called whenever **data is sent to the
server**. Think of this as the method for correctly formatting any params
**outgoing from the client to the server**.

`toJSON` returns a shallow copy of the model's attributes for JSON
stringification.


```js
// app/assets/javascripts/models/comment.js
window.Todo.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",

  toJSON: function () {
    // get the "would be" json.
    var json = Backbone.Model.prototype.toJSON.call(this);

    // remove things that shouldn't get sent back.
    // these attributes will not be permitted by strong params.
    delete json.id;
    delete json.created_at;
    delete json.updated_at;
    return json;
  }
});
```

## `validate`

`validate` is used to run client side validations on models. By default,
`validate` is called before save, but can also be called before set if {
validate: true } is passed. `validate` is passed the model attributes. If the
attributes are invalid, return an error. The returned
error can be either a string or error object. If `validate` returns an error,
save will not continue and the model will not be saved on the server. **NB**:
failed validations will trigger an "invalid" event and set the `validationError`
property on the model.

```js
var Post = Backbone.Model.extend({
  validate: function (attributes) {
    if (!attributes || !attributes.title || attributes.title == "") {
      return "cannot have an empty title";
    }
  }
});
```
