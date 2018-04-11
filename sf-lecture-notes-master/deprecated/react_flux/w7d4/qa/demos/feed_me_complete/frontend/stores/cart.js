var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher');

var _items = {};

var Cart = new Store(AppDispatcher);

Cart.all = function () {
  return _items;
};

Cart.isEmpty = function () {
  return Object.keys(_items).length == 0;
};

Cart.__onDispatch = function (payload) {
  switch(payload.actionType) {
    case "ADD_ITEM":
      addItem(payload.item);
      break;
    case "CLEAR_CART":
      clearCart();
      break;
  }
};

Cart.total = function () {
  var res = 0;
  Object.keys(_items).forEach(function (dishName) {
    var item = _items[dishName];
    res += item.dish.price * item.count;
  });
  return res;
}

var addItem = function (item) {
  var count = (_items[item.dish] ? _items[item.dish].count : 0) + 1;
  _items[item.dish] = { dish: item, count: count };
  Cart.__emitChange();
};

var clearCart = function () {
  _items = {};
  Cart.__emitChange();
};

module.exports = Cart;

