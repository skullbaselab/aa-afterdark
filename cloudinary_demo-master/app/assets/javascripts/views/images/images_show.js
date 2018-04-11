CloudinaryDemo.Views.ImagesShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },
  render: function(){
    this.$el.html(this.template({image: this.model}));
    return this;
  },
  template: JST['images/show']

});
