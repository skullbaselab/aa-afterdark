JournalApp.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.posts = options.posts;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'root',
    'posts/new': 'new',
    'posts/:id': 'show',
    'posts/:id/edit': 'edit'
  },

  edit: function (id) {
    var post = this.posts.getOrFetch(id);
    var formView = new JournalApp.Views.PostForm({
      collection: this.posts,
      model: post
    });

    this._swapView(formView);
  },

  new: function () {
    var newPost = new JournalApp.Models.Post();
    var formView = new JournalApp.Views.PostForm({
      collection: this.posts,
      model: newPost
    });

    this._swapView(formView);
  },

  root: function () {
    this._currentView && this._currentView.remove();
    this._currentView = null;
  },

  show: function (id) {
    var post = this.posts.getOrFetch(id);
    var showView = new JournalApp.Views.PostShow({
      model: post
    });

    this._swapView(showView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
