window.Todo.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "todosIndex",
    "todos/new": "todosNew",
    "todos/:id": "todosShow",
  },

  todosIndex: function () {
    var indexView = new Todo.Views.TodosIndex({
      collection: Todo.Collections.todos
    });

    Todo.Collections.todos.fetch();
    this._swapView(indexView);
  },

  todosNew: function () {
    var newView = new Todo.Views.TodosNew();
    this._swapView(newView);
  },

  todosShow: function (id) {
    var todo = Todo.Collections.todos.getOrFetch(id);

    var showView = new Todo.Views.TodosShow({
      model: todo
    });
    
    this._swapView(showView);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;

    $("body").html(view.render().$el);
  }
});
