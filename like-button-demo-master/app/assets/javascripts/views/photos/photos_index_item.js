LikesDemo.Views.PhotosIndexItem = Backbone.CompositeView.extend({
  className: "col-md-4",

  template: JST["photos/index_item"],

  initialize: function () {
    var likeWidget = new LikesDemo.Views.LikeWidget({
      model: this.model
    });
    this.addSubview(".panel-footer", likeWidget);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      photo: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
