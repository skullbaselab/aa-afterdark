PaperclipDemo.Routers.Pirates = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
    },
    
    routes: {
        "" : "showForm"
    },
    
    showForm: function () {
        var view = new PaperclipDemo.Views.PiratesForm({ 
            model: new PaperclipDemo.Models.Pirate()
        });
        this.$rootEl.html(view.render().$el);
    }, 
});
