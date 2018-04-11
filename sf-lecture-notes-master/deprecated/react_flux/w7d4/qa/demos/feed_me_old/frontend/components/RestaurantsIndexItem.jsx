var React = require('react');

var RestaurantsIndexItem = React.createClass({
  render: function () {
    return (
      <div>
        <ul>
          <li>
            { this.props.name }
          </li>
        </ul>
      </div>
    );
  }
});

module.exports = RestaurantsIndexItem;
