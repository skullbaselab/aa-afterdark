var React = require('react');
var RestaurantActions = require('../actions/restaurant_actions');
var RestaurantsIndex = require('./RestaurantsIndex');

var App = React.createClass({
  componentDidMount: function () {
    RestaurantActions.fetch();
  },
  render: function () {
    return (
      <div>
        <h1>Feed.me</h1>
        <div className="sidebar">
          <RestaurantsIndex />
        </div>
        {this.props.children}
      </div>
    );
  }
});

module.exports = App;

