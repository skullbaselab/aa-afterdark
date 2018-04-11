App.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",

//  toJSON: function () {
//    // Overkill in Rails 4, where our
//    // CommentsController#comment_params can just silently toss these
//    // excess attributes.
//
//    var json = Backbone.Model.prototype.toJSON.call(this);
//    delete json.id;
//    delete json.created_at;
//    delete json.updated_at;
//  }
});
