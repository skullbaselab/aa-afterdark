App.Views.CommentsNew = Backbone.View.extend({
  template: JST["comments/new"],
  events: {
    "submit form": "submit",
    "keyup textarea": "renderPreview"
  },

  render: function () {
    var renderedContent = this.template({ todo: this.model });
    this.$el.html(renderedContent);

    return this;
  },

  renderPreview: function (event) {
    var content = $(event.currentTarget).val();
    this.$(".preview").html(marked(_.escape(content)));
  },

  submit: function (event) {
    var view = this;
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var comment = new App.Models.Comment(params["comment"]);
    comment.save({}, {
      success: function () {
        view.model.comments().add(comment);
        // re-render to clear form/preview
        view.render();
      }
    });
  }
});
