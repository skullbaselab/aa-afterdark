var React = require('react');
var RestaurantStore = require('../stores/restaurant');
var RestaurantActions = require('../actions/restaurant_actions');
var Menu = require('./Menu');

var Restaurant = React.createClass({
  getInitialState: function () {
    var restaurantId = this.props.params.id;
    var restaurant = RestaurantStore.find(parseInt(restaurantId));
    return { restaurant: restaurant };
  },
  _updateState :function () {
    var restaurantId = parseInt(this.props.params.id);
    this.setState({ restaurant: RestaurantStore.find(restaurantId)});
  },
  componentDidMount: function () {
    this.restaurantToken = RestaurantStore.addListener(this._updateState);
    RestaurantActions.fetch();
  },
  componentWillReceiveProps: function (nextProps) {
    var restaurantId = parseInt(nextProps.params.id);
    this.setState({ restaurant: RestaurantStore.find(restaurantId) });
  },
  componentWillUnmount: function () {
    this.restaurantToken.remove();
  },
  render: function () {
    var orderURL = "restaurants/" + this.state.restaurant.id + "/order";
    return (
      <div>
        <div className="restaurant">
          <h2>{this.state.restaurant.name}</h2>
          <Menu {...this.state.restaurant} />
        </div>
        { this.props.children }
      </div>
    );
  }
});

module.exports = Restaurant;
