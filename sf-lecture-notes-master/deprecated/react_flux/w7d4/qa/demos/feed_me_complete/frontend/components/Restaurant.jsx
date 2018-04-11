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
    this.restaurantToken = RestaurantStore.addListener(this._updateState);
  },
  componentWillReceiveProps: function (newProps) {
    var restaurantId = newProps.params.id;
    var restaurant = RestaurantStore.find(parseInt(restaurantId));
    this.setState({ restaurant: restaurant});
  },
  backToIndex: function () {
    this.props.history.push("/");
  },
  componentWillUnmount: function () {
    this.restaurantToken.remove();
  },
  render: function () {
    return (
      <div>
        <div className="restaurant">
          <button onClick={this.backToIndex}>Back to index</button>
          <h2>{this.state.restaurant.name}</h2>
          <Menu {...this.state.restaurant}/>
        </div>
        {this.props.children}
      </div>
    );
  }
});

module.exports = Restaurant;
