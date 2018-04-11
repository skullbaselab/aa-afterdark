var React = require('react');
var Link = require('react-router').Link;

var RestaurantsIndexItem = React.createClass({
  render: function () {
    return (
      <div>
        <ul>
          <li>
            <Link to={"/restaurants/" + this.props.id}>{this.props.name}</Link>
          </li>
        </ul>
      </div>
    );
  }
});

module.exports = RestaurantsIndexItem;
