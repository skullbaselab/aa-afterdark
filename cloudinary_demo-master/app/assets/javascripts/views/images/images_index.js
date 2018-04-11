CloudinaryDemo.Views.ImagesIndex = Backbone.View.extend({
  template: JST['images/index'],
  events: {
    "click button": "upload"
  },
  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
  },
  upload: function(e){
    var image = new CloudinaryDemo.Models.Image();
    e.preventDefault();
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result){
      var data = result[0];
      image.set({url: data.url, thumb_url: data.thumbnail_url});
      image.save({}, {
        success: function(){
          CloudinaryDemo.Collections.images.add(image);
        }
      });
    });
  },
  render: function(){
    this.$el.html(this.template({images: this.collection}));
    return this;
  }
});
