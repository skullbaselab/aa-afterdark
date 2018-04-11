NewsReader.Collections.Feeds = Backbone.Collection.extend({
  url: 'api/feeds',

  model: NewsReader.Models.Feed,

  getOrFetch: function (id) {
    var feedMaybe = this.get(id);

    if (!feedMaybe) {
      feedMaybe = new NewsReader.Models.Feed({ id: id });
      feedMaybe.fetch({
        success: function() {
          this.add(feedMaybe);
        }.bind(this)
      });
    } else {
      feedMaybe.fetch();
    }

    return feedMaybe;
  },

  getOrFetchEntry: function (feedId, entryId) {
    var feedMaybe = this.get(feedId);
    var entry;
    if (feedMaybe) {
      entry = feedMaybe.entries().getOrFetch(entryId);
    } else {
      entry = new NewsReader.Models.Entry({ id: entryId });
      entry.fetch();
    }

    return entry;
  },
});
