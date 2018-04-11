CloudinaryDemo.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "images/:id": "show"
  },
  index: function() {
    var images = CloudinaryDemo.Collections.images;
    var view = new CloudinaryDemo.Views.ImagesIndex({
      collection: images
    });
    $('#root').html(view.render().$el);
    images.fetch();
  },
  show: function(id) {
    var image = new CloudinaryDemo.Models.Image({id: id});
    var view = new CloudinaryDemo.Views.ImagesShow({
      model: image
    });

    $('#root').html(view.render().$el);
    image.fetch();
  }
});
