# Week 7 Day 2

### Backbone (Views and Routers)

- `$(el)` is, by default, a `<div></div>` where html elements get placed into the DOM
- `render`
  - alters `$(el)` in some way
  - always returns `this`
  ```js
    // for example
    render: function () {
      this.$el.html("some text");
      return this;
    }
  ```
- `events` hash, where the key is the name of the event, and the value is the function we're going to call
- `tagName` - changes the default HTML tag of the `el`
- `attributes`
- `JST` allows you to key into the template and returns a compiled version of the template
  ```js
  // for example
  template: JST["photos/photos_index"],

  render: function () {
    var content = this.template({ photos: _([]) });
    this.$el.html(content);
    return this;
  },
  ```

#### Events and Pub/Sub Design Pattern

```js
function Cat() {
  this._events = {};
  this.licks = 0;
}

Cat.prototype.on = function (name, func) {
  if (!this._events[name]) {
    this._events[name] = [];
  }
  this._events[name].push(func);
};

Cat.prototype.trigger = function (name) {
  var fns = this._events[name] || [];
  for (var i = 0; i < fns.length; i++) {
    fns[i]();
  }
};

Cat.prototype.eat = function () {
  this.licks++;
  if (this.licks > 3) {
    this.trigger("done_eating");
  }
};
```
- `listenTo` - instead of fetching and then calling a success callback inside `fetch()`, we'll just listen to changes

```js
initialize: function () {
  // what to listen to, events, the function you want to call on done
  this.listenTo(this.collection, 'sync', this.render);
},

events: {
  'click img': 'showUrl'
},

showUrl: function (event) {
  console.log(event.currentTarget.attr('src'));
}
```
- Don't use `data-`. That means you should be breaking down your views into subviews.


#### Antipatterns
- Don't manually write `$.ajax` requests. Use Backbone instead.


#### Subviews

```js
BbDemo.Views.PhotoDetail = Backbone.View.extend({
  template: JST["photos/photo_detail"],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    render this;
  }
})
```

#### Names of URL pieces
- `https://fbstatic.facebook.com:9000/me/photos?id=7#fun/fun`
  - protocol/scheme
  - subdomain
  - domain
  - tid
  - port
  - path
  - query string
  - fragment (or anchor) - comes after `#`. Everything before `#` is going to cause a full-page refresh


### Router

```js
BbDemo.Routers.Router = Backbone.Router.extend({
  initialize: function () {
    this.photos = new BbDemo.Collections.Photos();
  }
  routes: {
    '': 'photosIndex',
    'photos': 'photosIndex',
    'photos/:id': 'photoDetail'
  },

  photosIndex: function () {
    this.photos.fetch();

    var view = new BbDemo.Views.PhotosIndex({ collection: photos });

    $('body').html(view.render().$el);
  },

  photoDetail: function (id) {
    var photo = this.photos.getOrFetch(id);
    photo.fetch();

    var view = new BbDemo.Views.PhotoDetail({ model: photo });

    $('body').html(view.render().$el);
  }
});
```

- initialize the router
```js
new BbDemo.Routers.Router();
// history hooks up the routers to the views
Backbone.history.start();
```

- getOrFetch()
```js
getOrFetch: function (id) {
  var model = this.get(id);

  if (model) {
    model.fetch();
    return model;
  } else {
    model = new BbDemo.Models.Photo({ id: id });
    model.fetch({
      success: function () {
        this.add(model);
      }.bind(this)
    });
  }

  return model;
}
```
