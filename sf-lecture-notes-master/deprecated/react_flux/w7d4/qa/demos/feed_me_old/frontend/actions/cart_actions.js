var AppDispatcher = require('../dispatcher');

var CartActions = {
  addItem: function (item) {
    AppDispatcher.dispatch({
      actionType: "ADD_ITEM",
      item: item
    })
  },
  clearCart: function () {
    AppDispatcher.dispatch({
      actionType: "CLEAR_CART"
    });
  }
}

module.exports = CartActions;
