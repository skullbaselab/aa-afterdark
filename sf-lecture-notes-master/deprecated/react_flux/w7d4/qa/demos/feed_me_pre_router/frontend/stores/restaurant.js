var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher');

var _restaurants = [];

var RestaurantStore = new Store(AppDispatcher);

window.RestaurantStore = RestaurantStore;
RestaurantStore.__onDispatch = function (payload) {
  switch (payload.actionType) {
    case "RESET_RESTAURANTS":
      resetRestaurants(payload.restaurants);
      break;
  }
};

RestaurantStore.all = function () {
  return _restaurants.slice();
};
RestaurantStore.find = function (id) {
  var res = { name: '', menu: []};
  RestaurantStore.all().forEach(function (restaurant) {
    if (restaurant.id === id) {
      res = restaurant;
    }
  });
  return res;
};


function resetRestaurants (restaurants) {
  _restaurants = restaurants;
  RestaurantStore.__emitChange();
}


module.exports = RestaurantStore;
