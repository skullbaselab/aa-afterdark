let _recipes = [], _handlers = [];

const RecipesStore = {
  fetch: function () {
    $.ajax({
      url: "/api/recipes",
      dataType: "json",
      success: function (recipes) {
        _recipes = recipes;
        RecipesStore.onChange();
      }
    });
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

window.RecipesStore = RecipesStore;

module.exports = RecipesStore;
