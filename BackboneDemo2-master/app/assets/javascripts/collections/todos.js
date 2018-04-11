App.Collections.Todos = Backbone.Collection.extend({
  model: App.Models.Todo,
  url: "/api/todos",

  getOrFetch: function (id) {
    var todos = this;

    var todo;
    if (todo = this.get(id)) {
      todo.fetch();
    } else {
      todo = new App.Models.Todo({ id: id });
      todo.fetch({
        success: function () { todos.add(todo); }
      });
    }

    return todo;
  }
});

App.Collections.todos = new App.Collections.Todos();
