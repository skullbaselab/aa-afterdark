FriendlyKaminariDelayedDemo.Routers.Dogs = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.rootEl);
  },

  routes: {
    "": "index"
  },

  index: function () {
    var view = new FriendlyKaminariDelayedDemo.Views.DogsIndex({
      collection: FriendlyKaminariDelayedDemo.dogs
    });
    this.$rootEl.html(view.render().$el);
  }
});
