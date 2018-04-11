window.Todo.Collections.TodoComments = Backbone.Collection.extend({
  model: Todo.Models.Comment,

  url: function () {
    // return "/api/todos/" + this.todo.get("id") + "/comments";
    return this.todo.url() + "/comments";
  },

  initialize: function (models, options) {
    this.todo = options.todo;
  }
});
