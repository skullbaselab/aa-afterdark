let _recipes = [], _handlers = [];

const RecipeStore = {
  fetch: function() {
    $.ajax({
      url: "/api/recipes",
      dataType: "json",
      success: function (recipes) {
        _recipes = recipes;
        RecipeStore.onChange();
      }
    })
  },
  all: function () {
    return _recipes;
  },
  addChangeHandler: function (handler) {
    _handlers.push(handler);
  },
  onChange: function () {
    _handlers.forEach(handler => {
      handler();
    });
  }
};

module.exports = RecipeStore;
