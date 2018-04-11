JournalApp.Views.PostsIndexItem = Backbone.View.extend({
  tagName: 'li',

  events: {
    'click .delete': 'destroyPost'
  },

  template: JST['posts/index_item'],

  initialize: function () {
    this.listenTo(this.model, 'sync destroy', this.render);
  },

  destroyPost: function (event) {
    this.model.destroy();
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });

    this.$el.html(renderedContent);

    return this;
  }
});
