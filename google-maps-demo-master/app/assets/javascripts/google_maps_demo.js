window.GoogleMapsDemo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new GoogleMapsDemo.Router({
      rootEl: '#content'
    });

    Backbone.history.start();
  }
};

$(document).ready(function(){
  GoogleMapsDemo.initialize();
});
