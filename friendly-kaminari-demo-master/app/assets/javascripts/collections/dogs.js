FriendlyKaminariDelayedDemo.Collections.Dogs = Backbone.Collection.extend({
  url: "/dogs",

  parse: function(response) {
    this.page_number = parseInt(response.page_number);
    this.total_pages = parseInt(response.total_pages);
    return response.models;
  },

  model: FriendlyKaminariDelayedDemo.Models.Dog
});
FriendlyKaminariDelayedDemo.dogs = new FriendlyKaminariDelayedDemo.Collections.Dogs();
FriendlyKaminariDelayedDemo.dogs.fetch({
  data: { page: 1 }
});
