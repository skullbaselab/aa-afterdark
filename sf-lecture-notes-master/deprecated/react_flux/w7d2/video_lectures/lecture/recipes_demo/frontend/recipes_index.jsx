const React = require('react');

const RecipesStore = require("./recipes_store");
const RecipesIndex = React.createClass({
  getInitialState: function () {
    return {recipes: RecipesStore.all()};
  },
  componentDidMount: function () {
    RecipesStore.fetch();
    //this.setState({recipes: RecipesStore.all()});
    RecipesStore.addChangeHandler(this._onRecipeChange);
  },
  _onRecipeChange: function () {
    this.setState({recipes: RecipesStore.all()});
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

module.exports = RecipesIndex;
