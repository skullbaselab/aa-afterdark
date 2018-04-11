(function(root) {
  'use strict';

  var _recipes = [], _handlers = [];
  root.RecipeStore = {
    all: function () {
      return _recipes.slice();
    },
    fetch: function () {
      $.ajax({
        url: "/api/recipes",
        dataType: "json",
        success: function(recipes){
          _recipes = recipes;
          RecipeStore.changed();
        }
      });
    },
    create: function(recipe){
      $.post("/api/recipes", {recipe: recipe}, function(recipe){
        _recipes.push(recipe);
        RecipeStore.changed();
      });
    },
    addChangeHandler: function(handler){
      _handlers.push(handler);
    },
    removeChangeHandler: function(handler){
      var idx = _handlers.indexOf(handler);
      if (idx !== -1){
        _handlers.splice(idx, 1);
      }
    },
    changed: function(){
      _handlers.forEach(function(handler){
        handler();
      });
    }
  };

}(this));
