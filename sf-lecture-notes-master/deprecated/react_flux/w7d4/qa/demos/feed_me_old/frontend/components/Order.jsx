var React = require('react');
var Cart = require('../stores/cart');
var CartActions = require('../actions/cart_actions');

var Order = React.createClass({
  getInitialState: function () {
    return { items: Cart.all() };
  },
  componentDidMount: function () {
    this.cartToken = Cart.addListener(this.updateOrder);
  },
  updateOrder: function () {
    this.setState({ items: Cart.all() });
  },
  componentWillUnmount: function () {
    CartActions.clearCart();
    this.cartToken.remove();
  },
  clearCart: function () {
    CartActions.clearCart();
  },
  render: function () {
    return (
      <div className="order">
        <h2>Cart</h2>
        <ul>
          { Object.keys(this.state.items).map(function (dishName) {
            var item = this.state.items[dishName];
            return <li key={dishName}>
              {item.count}x {dishName}: ${item.dish.price}
            </li>
            }.bind(this))
          }
        </ul>

        <p>
          { "Total: $" +Cart.total() }
        </p>

        <button onClick={this.clearCart}>Clear Cart</button>
      </div>
    );
  }
});

module.exports = Order;
