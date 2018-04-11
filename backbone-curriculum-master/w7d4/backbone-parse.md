## Parse

When Backbone receives data for a model, it expects a JSON object where
each key corresponds to an attribute on the model. For a collection, it
expects an array of such objects. This works well if
we are simply serializing and deserializing objects: we send either a
single object (for a model) or an array of them (for a collection).

The picture gets more complicated when we want to include more complicated
data structures. Let's say that we have a blog post that `has_many` comments.

We'd like to include the comments in the JSON we send when we fetch a post.
So we build a Jbuilder template to format the JSON payload:

```ruby
# show.json.jbuilder

json.extract! @post, :title, :body

json.comments @post.comments do |comment|
  json.extract! comment, :body
end
```

If we let Backbone run its course, we will have a model with a `comments`
attribute that points at an array of POJOs containing comment bodies. But
what we'd really like is to replicate our server-side association between
`comment` and `post` objects. To do this, we do two things:

1. Write a Backbone association method that will return a post's `comments`
   collection
2. Override Backbone's `parse` method to populate this collection from the
   JSON

Step 1:

```javascript
// post.js

comments: function () {
  if (!this._comments) {
    this._comments = new BlogApp.Collections.Comments([], { post: this });
  }
  return this._comments;
}
```

Step 2:

```javascript
//post.js

parse: function (response) {
  if (response.comments) {
    this.comments().set(response.comments);
    delete response.comments;
  }
  return response;
}
```

With this structure in place, JSON responses will be fed into our `parse`
method by Backbone before it sets the `post`'s attributes; this allows us
to `set` the contents of the `comments` collection with the comment data
that we sent from the server. Now we have a method that will return
associated models, and our `attributes` object includes only the post's
own attributes.

But wait: how does Backbone know to call our `parse` method? If we check
the [documentation](http://backbonejs.org/#Model-parse), we see that
Backbone **always** calls `parse` when it receives a response from `fetch`
and `save`. We don't usually notice this because the default method looks
like this:

```javascript
//backbone.js

parse: function (response, options) {
  return response;
}
```

This makes `parse` a bit like `initialize`: Backbone provides it so that
we can easily use the response from a single request to do more complicated
things than just build a single model or collection.

Note that, while `parse` is usually only called on the response to `fetch`
and `save`, we can force Backbone to call it in other cases by passing
`{ parse: true }` in the options of some other methods. This is useful
if we are including multiple layers of association in a response.

### References

* [Backbone documentation](http://backbonejs.org/#Model-parse)
* [Backbone source](http://backbonejs.org/docs/backbone.html)
