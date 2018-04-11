App.Views.TodosShow = Backbone.CompositeView.extend({
  template: JST["todos/show"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(
      this.model.comments(), "add", this.addComment
    );
    this.listenTo(
      this.model.comments(), "remove", this.removeComment
    );

    var commentNewView =
      new App.Views.CommentsNew({ model: this.model });
    this.addSubview(".comments-new", commentNewView);

    this.model.comments().each(this.addComment.bind(this));
  },

  addComment: function (comment) {
    var commentsShow =
      new App.Views.CommentsShow({ model: comment });
    this.addSubview(".comments", commentsShow);
  },

  removeComment: function (comment) {
    var subview = _.find(
      this.subviews(".comments"),
      function (subview) {
        return subview.model === comment;
      }
    );

    this.removeSubview(".comments", subview);
  },

  render: function () {
    var view = this;
    var renderedContent = this.template({
      todo: this.model
    });

    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  }
});
