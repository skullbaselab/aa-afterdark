window.PaperclipDemo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    PaperclipDemo.pirates = new PaperclipDemo.Collections.Pirates();
    PaperclipDemo.pirates.fetch({
        success: function (attribute) {
            new PaperclipDemo.Routers.Pirates({ $rootEl: $("#content") });
            Backbone.history.start();
        }
    });
  }
};

$(document).ready(function(){
  PaperclipDemo.initialize();
});
