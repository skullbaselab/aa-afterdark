App.Views.TodosNew = Backbone.View.extend({
  template: JST["todos/new"],

  events: {
    "submit form": "submit"
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newTodo = new App.Models.Todo(params["todo"]);

    newTodo.save({}, {
      success: function () {
        App.Collections.todos.add(newTodo);
        Backbone.history.navigate("/", { trigger: true });
      }
    });
  }
});
