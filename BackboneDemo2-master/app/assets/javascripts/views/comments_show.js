App.Views.CommentsShow = Backbone.View.extend({
  template: function () {
    return this.open ? JST["comments/edit"] : JST["comments/show"];
  },

  events: {
    "click button.destroy": "destroyComment",
    "dblclick div.content": "beginEditing",
    "submit form": "endEditing"
  },

  initialize: function (options) {
    this.open = false;
    this.listenTo(this.model, "change", this.render);
  },

  beginEditing: function () {
    this.open = true;
    this.render();
  },

  destroyComment: function (event) {
    event.preventDefault();
    this.model.destroy();
  },

  endEditing: function (event) {
    event.preventDefault();
    this.open = false;

    var params = $(event.currentTarget).serializeJSON();
    this.model.set(params["comment"]);
    this.model.save();

    this.render();
  },

  render: function () {
    var renderedContent = this.template()({ comment: this.model });
    this.$el.html(renderedContent);

    return this;
  }
});
