# Week 7 Day 1

### Backbone (Models and Collections)

- Jeremy Ashkenas is really cool (came up with Backbone, Underscore, and CoffeeScript)

Demo:
- build a Rails controller called StaticRoot
  - only has one method called `root`
- routes
  - `root "static_pages#root"`
- Gemfile
  - `gem "backbone-rails"`
- installing backbone

  ```sh
  > rails g backbone:install --javascript
  > rails g model Photo url title
  # Place the backbone controllers in a directory named Api
  > rails g controller Api/Photos
  > rails g controller Api/Comments
  ```
- remember to add `Api` to `class Api::CommentsController < ApplicationController` or else rails will fail and won't tell you exactly why.

- routes
  ```rb
  namespace :api, defaults: { format: :json } do
    resources :photos
    resources :comments
  end
  ```

- creating a collection in chrome dev tools console

  ```js
  var photos = new Backbone.Collection([], { url: "/api/photos" });
  photos.map(function (p) { return p.get('title') });
  photos.fetch();

  var p = new Backbone.Model();
  p.url = "api/photos/1"
  // must fetch first because p is new and has no id in the database.
  p.fetch();
  p.set('title', 'some new title');
  p.save();
  ```
- create backbone files

```js
BbDemo.Models.Comment = Backbone.Model.extend({
  urlRoot: '/api/comments',

  comments: function () {
    if (!this.comments) {
      this._comments = new BbDemo.Collections.Comments([], { photo: this });
    }
    return this._comments;
  },

  parse: function (data) {
    if (data.comments) {
      this.comments().set(data.comments);
      delete data.comments;
    }
    return data;
  },
});


BbDemo.Collections.Comments = Backbone.Collection.extend({
  url: '/api/comments',
  model: BbDemo.Models.Comment,

  initialize: function (models, options) {
    this.photo = options.photo;
  },

});
```

- `rails g backbone:scaffold comments --javascript`

- `jbuilder`: defines what json looks like when it comes from the API


```js

var p = new BbDemo.Models.Photo({ url: "some.com/url", title: "more fun"});
photos.add(p);
p.save();

// another way
photos.create({ url: "some.com/url", title: "more fun"});
photos.fetch();
```
