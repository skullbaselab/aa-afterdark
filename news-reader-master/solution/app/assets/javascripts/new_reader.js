window.NewsReader = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function() {
      var $rootEl = $('#content');
      var $sidebar = $('#sidebar');
      var feeds = new NewsReader.Collections.Feeds();
      feeds.fetch();

      // install the sidebar external to the router as it is
      // independent of any routing
      var feedsIndexView = new NewsReader.Views.FeedsIndex({
        collection: feeds
      });
      $sidebar.html(feedsIndexView.render().$el);

      new NewsReader.Routers.FeedRouter(feeds, $rootEl);
      Backbone.history.start();
    }
};
