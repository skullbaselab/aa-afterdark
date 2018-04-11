const React = require('react');
const RecipeStore = require('./recipe_store');

module.exports = React.createClass({
  getInitialState: function () {
    return {recipes: RecipeStore.all() };
  },
  componentDidMount: function () {
    RecipeStore.fetch();
    RecipeStore.addChangeHandler(this.recipesChanged)
  },
  recipesChanged: function () {
    this.setState({recipes: RecipeStore.all()});
  },
  render: function () {
    return (
      <ul>
        {
          this.state.recipes.map(recipe => {
            return <li key={recipe.id}>{recipe.name}</li>;
          })
        }
      </ul>
    );
  }
});
