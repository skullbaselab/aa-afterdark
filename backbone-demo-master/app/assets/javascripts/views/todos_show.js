window.Todo.Views.TodosShow = Backbone.CompositeView.extend({
  template: JST["todos/show"],

  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "add", this.addComment);
    this.listenTo(this.model.comments(), "remove", this.removeComment);

    this.model.comments().each(this.addComment.bind(this));

    var commentNewView = new Todo.Views.CommentsNew({
      todo: this.model
    });
    this.addSubview(".comment-new", commentNewView);
  },

  addComment: function (comment) {
    var commentsShowView = new Todo.Views.CommentsShow({
      model: comment
    });
    
    this.addSubview(".comments", commentsShowView);
    commentsShowView.render();
  },

  removeComment: function (comment) {
    var commentsShowView =
      _(this.subviews()[".comments"]).find(function (subview) {
        return subview.model == comment;
      });

    this.removeSubview(".comments", commentsShowView);
  },

  render: function () {
    var renderedContent = this.template({
      todo: this.model
    });

    this.$el.html(renderedContent);

    this.$(".comments").sortable({
      "axis": "y",
      "update": function (event, ui) { ui.item.trigger("move") }
    });

    this.renderSubviews();

    return this;
  }
});
