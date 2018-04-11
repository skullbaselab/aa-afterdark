window.JournalApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var posts = new JournalApp.Collections.Posts();
    posts.fetch({ reset: true });

    var indexView = new JournalApp.Views.PostsIndex({
      collection: posts
    });
    $('#sidebar').html(indexView.render().$el);

    new JournalApp.Routers.Posts({
      posts: posts,
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  JournalApp.initialize();
});
