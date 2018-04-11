window.LikesDemo = {
  Mixins: {},
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new LikesDemo.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};
