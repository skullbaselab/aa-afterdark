var React = require('react');
var RestaurantStore = require('../stores/restaurant');
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
    RestaurantStore.addListener(this._updateState);
  },
  render: function () {
    return (
      <div>
        <div className="restaurant">
          <h2>{this.state.restaurant.name}</h2>
          <Menu {...this.state.restaurant}/>
        </div>
      </div>
    );
  }
});

module.exports = Restaurant;
