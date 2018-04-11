CloudinaryDemo.Collections.Images = Backbone.Collection.extend({
  url: 'api/images',
  model: CloudinaryDemo.Models.Image
});

CloudinaryDemo.Collections.images = new CloudinaryDemo.Collections.Images();
