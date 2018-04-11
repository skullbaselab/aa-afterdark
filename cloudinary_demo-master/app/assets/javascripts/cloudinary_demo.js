window.CloudinaryDemo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(){ 
    new CloudinaryDemo.Routers.AppRouter();
    Backbone.history.start();
  }
}

$(function(){
  CloudinaryDemo.initialize();
});
