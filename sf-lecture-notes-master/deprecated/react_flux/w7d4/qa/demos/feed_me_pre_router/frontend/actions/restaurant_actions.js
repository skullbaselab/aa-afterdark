var AppDispatcher = require('../dispatcher');
var RestaurantsApi = require('../util/restaurants_api');

var RestaurantActions = {
  fetch: function () {
    AppDispatcher.dispatch({
      actionType: "RESET_RESTAURANTS",
      restaurants: RestaurantsApi.fetch()
    });
  }
};

module.exports = RestaurantActions;
