LikesDemo.Views.LikeWidget = Backbone.View.extend({
  template: JST["photos/like_widget"],

  events: {
    "click": "toggleLike"
  },

  initialize: function () {
    this.listenTo(this.model, 'change:num_likes', this.render);
  },

  toggleLike: function (event) {
    event.preventDefault();
    this.model.toggleLike();
  },

  render: function () {
    var renderedContent = this.template({
      like: this.model.like(),
      photo: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
