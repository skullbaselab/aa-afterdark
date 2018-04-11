var React = require('react');
var CartActions = require('../actions/cart_actions');

var Menu = React.createClass({
  addItem: function (item) {
    CartActions.addItem(item);
  },
  render: function () {
    return (
      <div>
        <h3>Menu</h3>
        <table>
          <thead>
            <tr>
              <th>Dish</th>
              <th>Price</th>
            </tr>
          </thead>
          <tbody>
            { this.props.menu.map(function (item) {
              return (
                <tr key={item.dish}>
                  <td>{item.dish}</td>
                  <td>${item.price}</td>
                  <td>
                    <button onClick={this.addItem.bind(null, item)}>
                      Add to Cart
                    </button>
                  </td>
                </tr>
                );
            }.bind(this))
            }
          </tbody>
        </table>
      </div>
    );
  }
});

module.exports = Menu;
