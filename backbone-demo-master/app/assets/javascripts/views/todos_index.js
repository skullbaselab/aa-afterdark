window.Todo.Views.TodosIndexRow = Backbone.View.extend({
  tagName: "tr",
  template: JST["todos/index_row"],

  render: function () {
    var renderedContent = this.template({ todo: this.model });

    this.$el.html(renderedContent);

    return this;
  }
});

window.Todo.Views.TodosIndex = Backbone.TableView.extend({
  rowSubviewClass: Todo.Views.TodosIndexRow,

  template: JST["todos/index"],
  
  events: _.extend({
    "click button.refresh": "refresh"
  }, Backbone.TableView.prototype.events),

  refresh: function () {
    this.collection.fetch();
  },

  render: function () {
    var renderedContent = this.template({
      todos: this.collection
    });

    this.$el.html(renderedContent);
    this.renderSubviews();

    return this;
  },

  _lowerTitle: function (model) {
    return model.get("title").toLowerCase();
  }
});
