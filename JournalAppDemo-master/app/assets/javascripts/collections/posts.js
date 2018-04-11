JournalApp.Collections.Posts = Backbone.Collection.extend({
  model: JournalApp.Models.Post,
  url: '/posts',

  getOrFetch: function (id) {
    var model = this.get(id),
        posts = this;

    if (model) {
      model.fetch();
    } else {
      model = new JournalApp.Models.Post({ id: id });
      model.fetch({
        success: function () {
          posts.add(model);
        },
      });
    }

    return model;
  },
});
