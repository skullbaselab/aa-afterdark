FriendlyKaminariDelayedDemo.Views.DogsIndex = Backbone.View.extend({
  initialize: function (options) {
    this.listenTo(this.collection, "add", this.render);
  },

  template: JST['dogs/index'],

  render: function () {
    var renderedTemplate = this.template({
      dogs: this.collection
    });
    this.$el.html(renderedTemplate);
    this.listenForScroll();
    return this;
  },

  listenForScroll: function () {
    $(window).off("scroll"); // remove previous listeners
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      if (view.collection.page_number < view.collection.total_pages) {
        view.collection.fetch({
          data: { page: view.collection.page_number + 1 },
          remove: false
        });
      }
    }
  }
});
