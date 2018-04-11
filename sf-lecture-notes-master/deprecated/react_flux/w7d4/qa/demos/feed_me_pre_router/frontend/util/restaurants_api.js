var restaurants = require('./restaurants');

var RestaurantsApi = {
  fetch: function () {
    return restaurants;
  }
};

module.exports = RestaurantsApi;
