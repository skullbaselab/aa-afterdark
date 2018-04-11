LikesDemo.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "index"
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  index: function () {
    var photos = new LikesDemo.Collections.Photos();
    photos.fetch();
    var indexView = new LikesDemo.Views.PhotosIndex({
      collection: photos
    });
    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
