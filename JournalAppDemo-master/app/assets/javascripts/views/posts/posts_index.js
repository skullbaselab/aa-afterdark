JournalApp.Views.PostsIndex = Backbone.View.extend({
  template: JST['posts/index'],

  initialize: function () {
    this.listenTo(
      this.collection,
      'add remove reset change:title',
      this.render
    );
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    this.collection.each(function (post) {
      var indexItem = new JournalApp.Views.PostsIndexItem({
        model: post
      });
      this.$('ul').append(indexItem.render().$el);
    }.bind(this));

    return this;
  }
});
