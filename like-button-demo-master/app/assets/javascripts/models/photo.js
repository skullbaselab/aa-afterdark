LikesDemo.Models.Photo = Backbone.Model.extend(
  _.extend({}, LikesDemo.Mixins.Likable, {
    urlRoot: "api/photos",

    likableOptions: {
      foreignKey: "photo_id"
    },

    parse: function (payload) {
      this.parseLike(payload);
      return payload;
    }
  })
);
