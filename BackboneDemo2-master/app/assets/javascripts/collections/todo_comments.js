App.Collections.TodoComments = Backbone.Collection.extend({
  model: App.Models.Comment,

  url: function () {
    return this.todo.url() + "/comments";
  },

  initialize: function (models, options) {
    this.todo = options.todo;
  }
});
