LikesDemo.Views.PhotosIndex = Backbone.CompositeView.extend({
  template: JST["photos"],

  initialize: function () {
    this.collection.each(this.addPhotoView.bind(this));
    this.listenTo(this.collection, 'add', this.addPhotoView);
    this.listenTo(this.collection, 'remove', this.removePhotoView);
  },

  addPhotoView: function (photo) {
    var photoView = new LikesDemo.Views.PhotosIndexItem({
      model: photo
    });
    this.addSubview('.photos', photoView);
  },

  removePhotoView: function (photo) {
    this.removeModelSubview('.photos', photo);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});
