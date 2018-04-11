var RecipesList = React.createClass({
  render: function () {
    return (
      <ul>
        {
          this.props.recipes.map(function(recipe){
            return <RecipesListItem key={recipe.id} recipe={recipe}/>
          })
        }
      </ul>
    );
  }
});
