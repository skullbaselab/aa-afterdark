window.FriendlyKaminariDelayedDemo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new FriendlyKaminariDelayedDemo.Routers.Dogs({ rootEl: "#content" });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  FriendlyKaminariDelayedDemo.initialize();
});
