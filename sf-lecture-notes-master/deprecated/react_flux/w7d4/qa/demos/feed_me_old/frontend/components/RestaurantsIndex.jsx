var React = require('react');
var RestaurantStore = require('../stores/restaurant');
var RestaurantsIndexItem = require('./RestaurantsIndexItem');
var CartActions = require('../actions/cart_actions');
var RestaurantActions = require('../actions/restaurant_actions');

var RestaurantsIndex = React.createClass({
  getInitialState: function () {
    return {restaurants: RestaurantStore.all()};
  },
  updateRestaurants: function () {
    this.setState({restaurants: RestaurantStore.all()});
  },
  componentDidMount: function () {
    RestaurantStore.addListener(this.updateRestaurants);
    RestaurantActions.fetch();
    CartActions.clearCart();
  },
  render: function () {
    return (
      <div>
        <h2>Restaurants</h2>
      { this.state.restaurants.map(function (restaurant) {
         return  <RestaurantsIndexItem key={restaurant.name} {...restaurant} />
        })
      }
      </div>
      );
  }
});

module.exports = RestaurantsIndex;
